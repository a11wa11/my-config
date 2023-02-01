import schedule
import socks, socket
import subprocess
import sys
import time
import urllib.request, urllib.error
from bs4 import BeautifulSoup

def connect_tor():
    """ TORへ接続 """
    socks.set_default_proxy(socks.PROXY_TYPE_SOCKS5, '127.0.0.1', 9050)
    socket.socket = socks.socksocket

def check_use_tor():
    """ Torを使っているかを返す """
    html = fetch_html('https://check.torproject.org/')
    return html.find('h1')['class'][0] != 'off'

def get_ip_addr():
    """ 現在のグローバルIPアドレスを返す """
    html = fetch_html('http://checkip.dyndns.com/')
    return html.body.text.split(': ')[1]

def fetch_html(url):
    """ URLからHTMLを返す """
    res = urllib.request.urlopen(url)
    return BeautifulSoup(res, 'html.parser')

def restart_tor():
    """ TORを再起動 """
    subprocess.run(["systemctl restart tor"], shell=True)
    time.sleep(10)

def scheduled_job():
    """ Torネットワークから対象のサーバへアクセスする """
    try:
        if use_Tor:
            connect_tor() # この行をコメントアウトすればTorネットワークではなく自身のネットワーク環境で使用可能
        print('You are using tor.' if check_use_tor() else 'You are not using tor.')
        print('Current IP address is ' + get_ip_addr())
        fetch_html(target_uri)
        print('[result] Successfully accessed.\n')
    except urllib.error.HTTPError:
        print('[result] Access is denied\n')
    except Exception as e:
        print('[result] Unexpected ERROR occurred.')
        print(e,'\n')
    finally:
        restart_tor()


# 引数の解析
args = sys.argv
if len(args) == 2:
    target_uri = args[1]
else:
    print('\nwrong number of arguments.\nUsage: python3 access_with_Tor.py [http[s]://]XXXXXX/path\n')
    print('引数で対象のURIを指定してください。※引数は１つのみです。\n例: python3 access_with_Tor.py https://ja.wikipedia.org/wiki/Amazon.com/\n')
    # 引数の指定がないときは「看護のお仕事」をサンプルとして使用
    sys.exit()
print('\ntarget URI -> ' + target_uri + '\n')

# Torを使用するかどうか
use_Tor = input('Torネットワークを使用しますか？ [y/n] --> ')  
if use_Tor == 'y':
    use_Tor = True
elif use_Tor == 'n':
    use_Tor = False
else:
    print('y / n で選択してください')
    sys.exit()
print('') #　改行するため

# 20秒ごとにscheduled_jobを実行
schedule.every(20).seconds.do(scheduled_job)
while True:
    schedule.run_pending()

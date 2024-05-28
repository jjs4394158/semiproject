# 라이브러리 추가
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException, StaleElementReferenceException
import time

# 브라우저 설정
chrome_options = Options()
chrome_options.add_experimental_option("detach", True)
chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])

# 웹 드라이버 실행
driver = webdriver.Chrome(options=chrome_options)

# 웹 페이지 열기
url = "https://www.lezhin.com/ko/ranking?genre=_all"
driver.get(url)

# 페이지 로딩 대기
time.sleep(2)

# 상세 정보를 담을 리스트 선언
detail_list = []

# 랭킹 탭 순회
for j in range(2, 12):
    driver.get(url)  # 랭킹 페이지로 돌아가기
    time.sleep(2)  # 페이지 로딩 대기

    ranking_selector = f"#ranking-tab-list > a:nth-child({j})"
    try:
        ranking = driver.find_element(By.CSS_SELECTOR, ranking_selector)
        ranking.click()
        
        time.sleep(2)  # 클릭 후 로딩 대기

        more_selector = "#rank-realtime > a"
        more = driver.find_element(By.CSS_SELECTOR, more_selector)
        more.click()

        time.sleep(5)  # 더보기 클릭 후 로딩 대기

        webtoon_list = []

        # 100개의 웹 요소에 대해 반복
        for i in range(1, 101):
            try:
                # CSS 선택자 동적 생성
                wtitle_selector = f"#ranking-tab-panel > ul > li:nth-child({i}) > a > div.lzComic__info > p.lzComic__title"
                thumbnail_selector = f"#ranking-tab-panel > ul > li:nth-child({i}) > a > div.lzComic__thumb > picture > img"
                authorname_selector = f"#ranking-tab-panel > ul > li:nth-child({i}) > a > div.lzComic__info > p.lzComic__meta > span.lzComic__artist"
                genres_selector = f"#ranking-tab-panel > ul > li:nth-child({i}) > a > div.lzComic__info > p.lzComic__meta > span.lzComic__genre"
                platform_selector = '#main-header > a'
                webtoon_url_selector = f"#ranking-tab-panel > ul > li:nth-child({i}) > a"

                # 해당 CSS 선택자로 웹 요소 찾기
                wtitle = driver.find_element(By.CSS_SELECTOR, wtitle_selector).text
                thumbnail = driver.find_element(By.CSS_SELECTOR, thumbnail_selector).get_attribute("src")
                authorname = driver.find_element(By.CSS_SELECTOR, authorname_selector).text
                genres = driver.find_element(By.CSS_SELECTOR, genres_selector).text
                platform = driver.find_element(By.CSS_SELECTOR, platform_selector).get_attribute('href')
                webtoon_url = driver.find_element(By.CSS_SELECTOR, webtoon_url_selector).get_attribute('href')

                # 웹툰 상세 페이지로 이동하여 스토리 정보 가져오기
                driver.get(webtoon_url)
                time.sleep(2)
                
                try:
                    info_button = driver.find_element(By.CSS_SELECTOR, '#comic-info > div > button')
                    info_button.click()
                    time.sleep(2)
                    story_element = driver.find_element(By.CSS_SELECTOR, '#comic-info-extend > dialog > div.comicInfoExtend__synopsis')
                    story = story_element.text
                except NoSuchElementException:
                    story = "No story available"

                # 정보를 딕셔너리에 추가
                webtoon_info = {
                    "wtitle": wtitle,
                    "thumbnail": thumbnail,
                    "authorname": authorname,
                    "genres": genres,
                    "platform": platform,
                    "webtoon_url": webtoon_url,
                    "story": story
                }

                # 정보를 리스트에 추가
                webtoon_list.append(webtoon_info)

                # 이전 페이지로 돌아가기
                driver.back()
                time.sleep(2)

            except (NoSuchElementException, StaleElementReferenceException):
                print(f"Error: 웹툰 정보 {i}를 찾을 수 없습니다.")
                continue  # 오류가 발생하면 다음 루프로 계속 진행
        
        # 웹툰 정보가 담긴 리스트 출력
        for webtoon in webtoon_list:
            print(webtoon)
            print("")

    except NoSuchElementException:
        print(f"Error: 웹툰 페이지 정보 {j}를 찾을 수 없습니다.")

# 스프링 서버의 엔드포인트
serverURL = "http://localhost:9091/smp"

# POST 요청으로 데이터 전송
import requests
import json

headers = {'Content-Type' : 'application/json'}
response = requests.post(serverURL, json=detail_list, headers = headers)

# 서버 응답 출력
# response.status_code => 성공 200, 오류 400, 404, 405, 500 등..
if response.status_code == 200:
    print('success!')
else :
    print(response.status_code)


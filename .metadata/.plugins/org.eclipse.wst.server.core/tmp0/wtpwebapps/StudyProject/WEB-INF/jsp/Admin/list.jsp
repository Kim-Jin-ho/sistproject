<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
</head>
<body>
<div>
	<h1>스터디룸 정보 목록</h1>
	<hr></hr>
</div>
	<div id="contentsWrap" class="contentsWrap">
		<div class="contents">
			<table class="bbsWrite mgb35">
				<tr>
					<th>지역</th>
					<td>
						<select>
							<option>서울</option>
							<option>경기</option>
							<option>인천</option>
						</select>
					</td>
					<th>&nbsp;추천</th>
					<td>
						<select>
							<option>높은순</option>
						</select>
					</td>
				</tr>
			</table>
	
			<table class="bbsList">
				<tr>
					<th style="width: 50px;" scope="col" class="fir">글번호</th>
					<th scope="col">지역</th>
					<th scope="col">제목</th>
					<th scope="col">작성자(아이디)</th>
					<th scope="col">작성일</th>
					<th scope="col">조회</th>
					<th scope="col">추천/비추천</th>
				</tr>
	
				<tr>
					<td style="text-align: center;" class="skNo">1</td>
					<td style="text-align: center;">경기</td>
					<td style="text-align: center;" class="reName"><a href="">으아아아아악</a></td>
					<td style="text-align: center;" >김진호(jinho528)</td>
					<td style="text-align: center;" >2016-05-11</td>
					<td style="text-align: center;">0</td>
					<td style="text-align: center;">0</td>
				</tr>
				<tr>
					<td style="text-align: center;" class="skNo">1</td>
					<td style="text-align: center;">서울</td>
					<td style="text-align: center;" class="reName"><a href="">ㅇ 어라ㅓ댬ㄴㅇㄹ</a></td>
					<td style="text-align: center;" >이재학(Lee)</td>
					<td style="text-align: center;" >2016-05-11</td>
					<td style="text-align: center;">0</td>
					<td style="text-align: center;">0</td>
				</tr>
				<tr>
					<td style="text-align: center;" class="skNo">1</td>
					<td style="text-align: center;">평양</td>
					<td style="text-align: center;" class="reName"><a href="">우에에엑</a></td>
					<td style="text-align: center;" >정성찬(chan)</td>
					<td style="text-align: center;" >2016-05-11</td>
					<td style="text-align: center;">0</td>
					<td style="text-align: center;">0</td>
				</tr>
			</table>
			<br></br>
			
			<div class="paging" style="position: fixed;">
				<a href="#"><img src="../img/button/btn_first.gif" alt="처음페이지" /></a>
				<a href="#"><img src="../img/button/btn_prev.gif" alt="이전" /></a>
				
				<span>
					<strong>1</strong>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">6</a>
					<a href="#">7</a>
					<a href="#">8</a>
					<a href="#">9</a>
				</span>				

				<a href="#"><img src="../img/button/btn_next.gif" alt="다음" /></a>
				<a href="#"><img src="../img/button/btn_last.gif" alt="마지막페이지" /></a>
				
				<span class="fr">
						<span class="button"><a href="#">글쓰기</a></span>
				</span>
			</div>
		</div>
	</div>
</body>
</html>
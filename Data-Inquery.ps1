$a=Invoke-RestMethod -Uri "JUSTMYSOCKS-API" 
#Paste the API link in your Just My Socks API Panel.
 $d=$a.bw_counter_b/1000000000
 $e=$a.monthly_bw_limit_b/1000000000
 $f = Get-Date
 $b=[pscustomobject]@{
 "UP-TO-DATE AS OF"="$f"
 "Total Allowance (GB)"=$e
 "Used Data Amount (GB)"=$d
 "Remaining Data Amount (GB)"=$e-$d
 }
 $b | ConvertTo-Html -Title "XXXX" -Head "<meta charset='utf-8'>" -Body "<H4>The Result of getbwcounter</H4><H1>请勿分享此链接; 如果下方都显示0，则代表网络不通/获取失败</H1><H1>This is an automated task, if you have problems of any sorts, please contact Admin.</H1><h2>Counter resets monthly on day 7 – Los Angeles time zone</h2><h3>如果需要历史记录，请访问<a href='Http://XXXX/archive.txt'>这里</a></h3><h2>" | out-file "X:XXXX\index.html"
$b | out-file "X:XXXX\archive.txt" -Append
#XXXX can be replaced when needed.
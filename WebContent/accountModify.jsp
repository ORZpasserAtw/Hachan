<%@ page language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改舊帳📒LIFF-Bismarck</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperL" href="#SaveAccount">保存</a>
            <a class="button upperR" href="#RecoveryAccount">復原</a>
            <a class="button bottom" href="account.jsp">回到記帳小本本</a>
        </div>
    </div>
    <div class="content">
        <form action="#" method="get">
            <div class=separate2>
                <label>
                    <div>選擇日期：</div>
                    <div><input type="date" name="date"></div>
                </label>
            </div>
            <div class="separate2 cardview modaccount">
                <label>
                    <div>日期：</div><br>
                    <div><input type="date" name="date" value="2020-01-01"></div><br>
                </label>
                <label>
                    <div>分類：</div><br>
                    <div><select class="AccountCat">
                            <option selected value="食">食</option>
                            <option value="衣">衣</option>
                            <option value="住">住</option>
                            <option value="行">行</option>
                            <option value="育樂">育樂</option>
                        </select></div><br>
                </label>
                <label>
                    <div>事件：</div><br>
                    <div><input type="text" name="title" value="牛排"></div><br>
                </label>
                <label>
                    <div>金額：</div><br>
                    <div><input type="number" name="title" value="500"></div><br>
                </label>
            </div>
            <div class="separate2 cardview modaccount">
                <label>
                    <div>日期：</div><br>
                    <div><input type="date" name="date" value="2020-04-20"></div><br>
                </label>
                <label>
                    <div>分類：</div><br>
                    <div><select class="AccountCat">
                            <option value="食">食</option>
                            <option selected value="衣">衣</option>
                            <option value="住">住</option>
                            <option value="行">行</option>
                            <option value="育樂">育樂</option>
                        </select></div><br>
                </label>
                <label>
                    <div>事件：</div><br>
                    <div><input type="text" name="title" value="褲子"></div><br>
                </label>
                <label>
                    <div>金額：</div><br>
                    <div><input type="number" name="title" value="1000"></div><br>
                </label>
            </div>
        </form>
    </div>
    <div class="footer">
        <a href="indexold.html">this is footer</a>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="plugin/jquery.finger.min.js"></script>
    <script src="main.js"></script>
</body>

</html>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
 <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  <a id="kakao-login-btn"></a>
  <div id="result"></div>
 

 
<script type="text/javascript">
Kakao.init('eb04491fab3a13ae1e74344e1441958c');
console.log(Kakao.isInitialized());

  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(result) {
          $('#result').append(result);
          id = result.id
          connected_at = result.connected_at
          kakao_account = result.kakao_account
          $('#result').append(kakao_account);
          resultdiv="<h2>로그인 성공 !!"
          resultdiv += '<h4>id: '+id+'<h4>'
          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
           
          $('#result').append(resultdiv);
          
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
</body>
</html>
 
### 1.注册并发送验证码到手机
```
curl -X POST \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "Content-Type: application/json" \
  -d '{"username":"cooldude6","password":"p_n7!-e8","mobilePhoneNumber":"18680306621"}' \
  https://api.leancloud.cn/1.1/users 
```

### 2.验证验证码是否正确
```
curl -X POST \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.leancloud.cn/1.1/verifyMobilePhone/:verifycode
```

### 3.请求手机号码验证(当收不到验证码时可以再次请求验证码)
```
curl -X POST \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "Content-Type: application/json" \
  -d '{"mobilePhoneNumber": "186xxxxxxxx"}' \
  https://api.leancloud.cn/1.1/requestMobilePhoneVerify 
```

### 4.设置密码(直接用密码登录)
```
curl -X GET \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -G \
  --data-urlencode 'mobilePhoneNumber=186xxxxxxxx' \
  --data-urlencode 'password=p_n7!-e8' \
  https://api.leancloud.cn/1.1/login 
```
### 5.忘记密码（使用手机号和验证码重置密码）
```
curl -X POST \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "Content-Type: application/json" \
  -d '{"mobilePhoneNumber": "186xxxxxxxx"}' \
  https://api.leancloud.cn/1.1/requestPasswordResetBySmsCode 
  
  curl -X PUT \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "Content-Type: application/json" \
  -d '{"password": "new password"}' \
  https://api.leancloud.cn/1.1/resetPasswordBySmsCode/收到的6位验证码 
  
```

### 6.设置用户（用户名、头像）
```
curl -X PUT \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "X-LC-Session: qmdj8pdidnmyzp0c7yqil91oc" \
  -H "Content-Type: application/json" \
  -d '{"phone":"18600001234"}' \
  https://api.leancloud.cn/1.1/users/55a47496e4b05001a7732c5f 
```
### 7.安全的修改密码
```
curl -X PUT \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "X-LC-Session: qmdj8pdidnmyzp0c7yqil91oc" \
  -H "Content-Type: application/json" \
  -d '{"old_password":"the_old_password", "new_password":"the_new_password"}' \
  https://api.leancloud.cn/1.1/users/55a47496e4b05001a7732c5f/updatePassword 
```
### 8.创建对象
```
curl -X POST \
  -H "X-LC-Id: qfSKr2zbzrTrfEJ5myQg1U6r" \
  -H "X-LC-Key: zlRppE8vBefoRDCKvnNicLzh" \
  -H "X-LC-Session: wh5vv32tmtyyck81dxytv0ojy" \(用于权限控制)
  -H "Content-Type: application/json" \
  -d '{"content": "每个 Java 程序员必备的 8 个开发工具","pubUser": "LeanCloud官方客服","pubTimestamp": 1435541999}' \
  https://api.leancloud.cn/1.1/classes/Post 
```
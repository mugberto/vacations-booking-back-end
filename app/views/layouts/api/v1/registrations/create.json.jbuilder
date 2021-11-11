if @user.save
  json.token JsonWebToken.encode(sub: @user.id)
else
  json.errors ['Registration failed!'] 
end
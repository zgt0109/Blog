puts "-"*50
puts "创建测试个人用户数据......"
User.create(email:'2506526350@qq.com', password: '12345678')

puts "-"*50
puts "创建测试管理员数据......"
Admin.create(email:'admin@qq.com', password: '12345678')

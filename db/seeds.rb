puts "-"*50
puts "创建测试个人用户数据......"
User.create(email:'2506526350@qq.com', password: '12345678')

puts "-"*50
puts "创建测试管理员数据......"
admin = Admin.new(email:'admin@qq.com', password: '12345678')

puts "-"*50
puts "创建测试文章数据......"

(1..10).each do |article_seq|
  admin.articles.build(
    title: "文章标题_#{article_seq}",
    content: "文章内容_#{article_seq}",
    article_type: "it"
  )
end
admin.save

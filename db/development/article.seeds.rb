sequence_min = 1
sequence_max = 10

puts "-"*50
puts "创建测试文章数据......"

after "development:admins" do
  admin = Admin.find_by_email('admin@qq.com')
  (sequence_min..sequence_max).each do |article_seq|
    admin.articles.create(
      title: "文章标题_#{article_seq}",
      content: "文章内容_#{article_seq}",
      article_type: "note"
    )
  end
end

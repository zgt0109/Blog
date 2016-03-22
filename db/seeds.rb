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
    title: "苹果iPhone 7会有几个牛X的改变？_#{article_seq}",
    content: "iPhone 7高配版高清细节谍照，可见双摄像头和Smart Connector接口
              看过了图，有必要说道说道iPhone 7可能会带来的几大重要改变，
              这些功能的提升往往要比外观重设来的更加凶猛和实在。抛去肯定会提升的常规硬件配置不说，
              iPhone 7系列还将会有哪些刺激感官的变化？_#{article_seq}",
    article_type_id: 10
  )
end
admin.save

puts "-"*50
puts "创建文章分类数据......."

%w(
	时间管理 英语角 演讲技巧 学习技巧 生活健康 养生之道 旅游景点 游戏娱乐
	摄影知识 苹果咨询 安卓最新动态 微软大事件 面试技巧 投资理财 电影资讯
).each do |name|
	ArticleType.create(name: name, created_at: Time.zone.now)
end

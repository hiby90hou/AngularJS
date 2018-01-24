Project.delete_all
User.delete_all
# delete everything without any rule

arr1 = ['misstyrose','fairy','cake','candy']
arr2 = ['rice','meat','pork','soup']

user = User.new
user.email = 'hiby.90hou@gmail.com'
user.password = "123456"
user.save

10.times do
	Project.create(
		title: "#{arr1.sample} #{arr2.sample}",
		user_id: user.id)
end
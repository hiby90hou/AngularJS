class User < ApplicationRecord

	has_many :posts

	 # validates方法：需要验证的属性名, 验证方法
    # presence存在验证，length长度验证，format格式验证
    validates :userName,
              presence:true,
              length:{maximum: 20}

    EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email,
              presence:true,
              format:{with: EMAIL},
              # 默认的唯一性验证是大小写敏感的，这里的邮箱验证不需要
              uniqueness: {case_sensitive: false}

    has_secure_password
    validates :password, length:{minimum:6}, confirmation:true
end

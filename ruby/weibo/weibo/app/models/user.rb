class User < ApplicationRecord

validates :userName, presence:true, length: {maximum: 20}
EMAIL = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ 
validates :email, presence:true, length: {maximum: 255}, format: {with: EMAIL},
			uniqueness: {case_sensitive: false}

end

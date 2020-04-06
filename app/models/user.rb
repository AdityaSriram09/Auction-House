class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # This says that one user can have many products(Coz user_id is the foreign key in products Table)
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

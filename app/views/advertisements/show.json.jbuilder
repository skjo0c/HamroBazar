json.extract! @item, :id, :name, :description, :pictures, :created_at, :updated_at

json.extract! @user, :id, :firstname, :description, :picture, :created_at, :updated_at

json.user @advertisement.user, :firstname
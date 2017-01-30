class Archivo < ActiveRecord::Base
	mount_uploader :photo ,ImagenUploader
end

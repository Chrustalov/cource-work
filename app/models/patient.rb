class Patient < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user

  enum gender: { male: 0, female: 1}, _suffix: :gender
end

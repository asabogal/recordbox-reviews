class Review < ApplicationRecord
  belongs_to :user
  belings_to :record
end

class Tagging < ApplicationRecord
  belongs_to :pin
  belongs_to :article
end

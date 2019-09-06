class Post < ApplicationRecord
    belongs_to :location
    belongs_to :user

    # defaultはOther
    enum withdraw_flag: %i(Smoking PowderRoom Cloak Other)
end

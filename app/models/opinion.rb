class Opinion < ApplicationRecord
    belongs_to :user

# defaultは特に理由はない
    enum withdraw_flag: %i(
        特に理由は無い サービスの品質に不満がある 使用頻度が低い 運営の対応が悪い 見づらい•使いづらい その他
    )
    def self.flag_keys
        self.withdraw_flags.keys
    end
end

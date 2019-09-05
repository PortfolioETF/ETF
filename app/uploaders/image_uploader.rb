class ImageUploader < ApplicationUploader
    def extension_whitelist
        %w(jpg jpeg gif png)
    end

    def accept_extensions
        accept_list = extension_whitelist.map { |e| "image/#{e}" }
        accept_list.join(",")
    end
end

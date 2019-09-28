class ImageUploader < ApplicationUploader

    if Rails.env.development?
        storage :file
    elsif Rails.env.test?
        storage :file
    else
        storage :fog
    end

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def extension_whitelist
        %w(jpg jpeg gif png)
    end

    def filename
        original_filename if original_filename
    end

    def accept_extensions
        accept_list = extension_whitelist.map { |e| "image/#{e}" }
        accept_list.join(",")
    end
end

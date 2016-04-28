# This is really shitty and no one should ever monkey patch, but the Apple News API
# requires that the size of the form part should be specified in the Content-Disposition
# header, and not with the Content-Length header. I'm not sure if size is even a valid param
# in the Content-Disposition header, but here we are.
module Parts
  class FilePart
    def build_head(boundary, name, filename, type, content_len, opts = {}, headers = {})
      trans_encoding = opts["Content-Transfer-Encoding"] || "binary"
      content_disposition = opts["Content-Disposition"] || "form-data"

      part = ''
      part << "--#{boundary}\r\n"
      part << "Content-Disposition: #{content_disposition}; name=#{name}; filename=\"#{filename}\"; size=#{content_len}\r\n"
      part << "Content-Length: #{content_len}\r\n"
      if content_id = opts["Content-ID"]
        part << "Content-ID: #{content_id}\r\n"
      end

      if headers["Content-Type"] != nil
        part <<  "Content-Type: " + headers["Content-Type"] + "\r\n"
      else
        part << "Content-Type: #{type}\r\n"
      end

      part << "Content-Transfer-Encoding: #{trans_encoding}\r\n"
      part << "\r\n"
    end
  end
end

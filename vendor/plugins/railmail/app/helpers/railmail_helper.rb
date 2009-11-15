module RailmailHelper
  def delivery_body(d)
    raw = d.raw
    return raw if raw.is_a? String
    return raw.body unless raw.multipart?
    
    part = get_body(raw, 'text/html')
    part ||=  begin
                body = get_body(raw, 'text/plain')
                if body
                  "<pre class=\"plain_text\">#{body}</pre>"
                end
              end
    part ||= raw.parts.first.body
    part
  end
  
  private
  def get_body(raw, mime)
    part = raw.parts.select{|p| p.content_type == mime} 
    if part.first
      part.first.body
    end
  end
end

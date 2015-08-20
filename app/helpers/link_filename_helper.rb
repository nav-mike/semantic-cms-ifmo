# Helper for ipm.ifmo files links
# @author M. Navrotskiy m.navrotskiy@gmail.com
module LinkFilenameHelper
  def pz_template_url(url = nil)
    return url unless url.blank?
    'http://ipm.ifmo.ru/wp-content/uploads/2014/11/TemplateПояснительная-записка.Титульник.docx'
  end
end

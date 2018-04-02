module ApplicationHelper

  # 根据所在的页面返回完整的标题
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  private
    def uptoken

      put_policy = Qiniu::Auth::PutPolicy.new(
        "<op1pcc4aq.bkt.clouddn.com>",             #存储空间
        nil,                                       #最终资源名
        1800，                                      #相对有效期
        (Time.now + 30.minutes).to_s                #绝对有效期
      )

      uptoken = Qiniu::Auth.generate_uptoken(put_policy)   #生成凭证

    end
end

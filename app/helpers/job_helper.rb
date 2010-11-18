module JobHelper
  def description_with_contacts(job, description)
    out = description
    if job.email.present?
      out << raw(<<-HTML)
      <p><a href="mailto:#{job.email}">#{job.email}</a></p>
      HTML
    end
    if job.phone.present?
      out << raw(<<-HTML)
      <p><a href="tel://#{job.phone}">#{job.phone}</a></p>
      HTML
    end
    out
  end
end

atom_feed do |feed|
  feed.title "Android Jobs near Boston"
  feed.icon image_path("logo.png")
  feed.subtitle "Find an Android-related job in the metro Boston area"
  feed.updated @jobs.first.updated_at
  feed.author do |author|
    author.name "Boston Android Developer Group"
    author.uri "http://bostonandroid.org/"
  end

  @jobs.each do |job|
    feed.entry(job) do |entry|
      entry.title job.subject
      entry.content description_with_contacts(job, auto_link(simple_format(job.description))), :type => 'html'

      entry.author do |author|
        author.name job.organization
        if job.email.present?
          author.email job.email
        end
      end
    end
  end
end

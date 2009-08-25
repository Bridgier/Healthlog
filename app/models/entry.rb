class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  
  validates_uniqueness_of :entry_date, :message => "Only one log entry per day!"
  
  def self.fetchLogList(id)

    query = "select
                to_char(log_date, 'YYYY') as year,
                rtrim(to_char(log_date, 'MMMonth')) as month,
                log_date::date,
                case
                    when entries.entry_date is not null then 1
                    else 0
                end::int as exists
                from (select now()::date - generate_series(1, (select now()::date - min(entry_date::date) from entries) +30) as log_date) as date_seq 
                     left outer join entries on (date_seq.log_date = entries.entry_date)
                where user_id = %d or user_id is null" % id

    result = connection.execute(query) 

    logList = Hash.new(&(p=lambda{|h,k| h[k] = Hash.new(&p)}))

    result.each do |res|
      logList[res["year"]][res["month"]][res["log_date"]] = res["exists"]
    end

    logList
  end

end


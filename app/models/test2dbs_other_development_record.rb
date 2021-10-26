class Test2dbsOtherDevelopmentRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :test2dbs_other_development, reading: :test2dbs_other_development }
end

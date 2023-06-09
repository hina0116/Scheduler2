class Event < ApplicationRecord

   default_scope -> { order(start: :asc) }

   validate  :start_end_check

   def start_end_check
     if self.start.present? && self.end.present?
       errors.add(:end, "が開始時刻を上回っています。正しく記入してください。") if self.start > self.end
     end
   end
end

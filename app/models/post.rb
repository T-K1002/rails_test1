class Post < ApplicationRecord
    validates :title, {presence:true,length:{maximum:20}}
    validates :content, {presence:true,length:{maximum:500}}
    validates :start_at, {presence:true}
    validates :end_at, {presence:true}
    validate :start_end_check

    def start_end_check
      if start_at.nil? || end_at.nil?
      return
      end
      if self.end_at < self.start_at
      errors.add(:end_at, "は開始日より前の日付は登録できません") 
      end
    end

end

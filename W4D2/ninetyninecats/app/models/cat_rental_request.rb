class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: 'Cat'

  def overlapping_requests
    # cat = DBConnection.instance.execute(<<-SQL, id)
    #   SELECT
    #     cat_id, start_date, end_date
    #   FROM
    #     cat_rental_requests
    #   WHERE
    #     status = "APPROVED" AND (cat_id = ?, id)
    #
    # SQL

    CatRentalRequest.where("cat_id = #{self.cat_id}")
                    # .where()
  end
end

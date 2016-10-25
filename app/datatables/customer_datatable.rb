class CustomerDatatable < AjaxDatatablesRails::Base
  
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_customer_path, :customer_path, :create_job_path, :customer_account_jobs_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Customer.name', 'Customer.company', 'Customer.account_number', 'Customer.phone_one']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Customer.name', 'Customer.company', 'Customer.account_number', 'Customer.phone_one']
  end

  private

  def data
    records.map do |record|
      [
        record.name,
        record.company,
        record.account_number,
        record.phone_one,
        link_to("", edit_customer_path(record), class: "glyphicon glyphicon-pencil"),
        link_to("", customer_path(record), data:{confirm: 'Are you sure?'}, class: "glyphicon glyphicon-trash",  method: :delete),
        link_to("Job", create_job_path(record), data:{confirm: 'Are you sure?'}, class: "glyphicon glyphicon-new-window"),
        link_to("Jobs", customer_account_jobs_path(record), class: "glyphicon glyphicon-search")

        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      ]
    end
  end

  def get_raw_records
    Customer.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end

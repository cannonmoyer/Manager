class JobDatatable < AjaxDatatablesRails::Base

 include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_customer_path, :customer_path, :create_job_path, :customer_job_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ["Job.id", "Job.customer.name", "Job.customer.phone_one", "Job.customer.email", "Job.status"]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["Job.id", "Job.customer.name", "Job.customer.phone_one", "Job.customer.email", "Job.status"]
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.id,
        record.customer.name,
        record.customer.phone_one,
        record.customer.email,
        record.status
      ]
    end
  end

  def get_raw_records
    # insert query here
    Job.where.not(status: "Completed But Not Billed").where.not(status: "Completed And Billed")
    
  end

  # ==== Insert 'presenter'-like methods below if necessary
end





#<td><%= f.customer.name %></td>
     # <td><%= f.customer.account_number %></td>
    #  <td><%= f.date %></td>
     # <td><%= f.time %></td>
     # <td><%= f.description %></td>
      #<td width="125">[<%= link_to "edit", edit_job_path(f),  class: "glyphicon glyphicon-pencil" %>] | [<%= link_to "delete", job_path(f),  class: "glyphicon glyphicon-trash", method: :delete %>] </td>
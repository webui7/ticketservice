class TicketMailer < ActionMailer::Base
  default :from => "webui7@gmail.com"
  def ticket_delivered(ticket)
    @ticket = ticket
    last_id=@ticket.id
    ticket_status=@ticket.status.statusname
    ticket_department=@ticket.department.depname
    html_link='http://localhost:3000/tickets/'+last_id.to_s
    a = "Dear #{ticket.name} your Ticket with reference #{ticket.reference} and status \"#{ticket_status}\" is submitted by  \"#{ticket_department}\" , check its status later by following link #{html_link}\nRegards,\nSupport team"
    mail(:to => ticket.email, :subject => "YOUR ticket status")do |format|
      format.text { render :text => a }
    end
  end
end
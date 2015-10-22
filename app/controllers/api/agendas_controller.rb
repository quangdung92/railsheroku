# This Class is AgendasController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::AgendasController < ApplicationController

  # get agendas of proceeding
  def get_agendas_of_proceeding
    @agendas = Agenda.get_agendas_of_proceeding(params[:id])
    @agendas.each_with_index do |agenda, index|
      @agendas[index].content = ApplicationController.helpers.sanitize(
        agenda.content,
        :tags => ['h1', 'b', 'div', 'p', 'span', 'br', 'ul', 'li'],
        :attributes => ['id', 'class', 'name', 'type']
      ) 
    end
    @agendas
  end

  # delete agenda
  def delete_agenda
    @delete_agenda_ret = Agenda.delete(params[:params][:id])
  end
 
  # create or update agenda
  def create_or_update_agenda
    if Agenda.exists?(params[:params][:id])
      #update
      @create_or_update_agenda = Agenda.find(params[:params][:id])
      if @create_or_update_agenda.update(:content =>  params[:params][:agenda_content])
      else
      end
    else
      #create
      @create_or_update_agenda = Agenda.new(:content => params[:params][:agenda_content], :proceeding_id => params[:params][:proceeding_id])
      if @create_or_update_agenda.save
        logger.debug(@create_or_update_agenda.id)
      else
      end
    end

    @create_or_update_agenda

  end
  
  # 2015/09/09 k.haramoto add -------------------------------------------------
  # create or update agenda
  def all_update_agenda 

    agendas = params[:params]
    @all_update_agenda_ret = 0 

    begin
      unless agendas.blank?
        agendas.each do |agenda|
          #update
          l_agenda = Agenda.find(agenda[:id])
          l_agenda.update(:content =>  agenda[:agenda_content])
        end
        @all_update_agenda_ret = 0
      else
        @all_update_agenda_ret = -1
      end    
    rescue => e
      logger.error(e.message)
      @all_update_agenda_ret = -2 
    end

    @all_update_agenda_ret

  end
  # end -----------------------------------------------------------------------
end

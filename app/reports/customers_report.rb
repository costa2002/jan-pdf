# encoding: utf-8
class CustomersReport < Prawn::Document

  #--------------------------------------------------------------------------


  def to_pdf
    #===Variable ========================================================
    creation_date = Time.now.strftime(" %e %b %Y in %H:%M")
     @customers = Customer.order('created_at')
    
  items = @customers.each do |item|
    @name =  item.name
    @phone = item.phone 
    @address=item.address
    @city =item.city
    @state=item.state
    @zip=item.zip
    @cource_location=item.courselocation
    @e_mail=item.email
    @instructor_name=item.instructorsname
  end

#----------------Logo-----------------------------------------------------

#image "#{Prawn::BASEDIR}/data/images/stef.jpg"

    #--------------------------------------------------------------------
    #========Header page------------------------------------------
    move_down(18)
    font_size(14)
    text "BLS for Healthcare Provider Test Answer Sheet",:align=>:center
    move_down(22)

    font_size(12)
    text "Name:_________________________ Date: " + creation_date + "  Test Version:   A   B", :align=>:center
    stroke_circle [498, cursor+9], 8
    formatted_text_box [ { :text=> @name}], :at => [75,cursor+14]
    move_down(27)

    text "Please do not write in the test booklet
Return this answer sheet along with your test booklet to your instructor upon completion of test. ", :align=>:center, :style => :italic
    move_down(40)
    font_size(13)


  bounding_box [96, 550], :width => 160, :height => 450 do
  #transparent(0.5) { stroke_bounds }
  1.upto(13) do |i|
    
    x = 0
    y = -(i * 15)
    translate(x, y) do
      
      # Draw a point on the new origin
      stroke_circle [60, 460+y], 10
      text "#{i}.      A       B      C      D",
                :size => 13 , :align => :right      
     end
  end
end

 bounding_box [296, 550], :width => 160, :height => 450 do
  #transparent(0.5) { stroke_bounds }
  1.upto(12) do |i|
    
    x = 0
    y = -(i * 15)
    translate(x, y) do
      
      # Draw a point on the new origin
      stroke_circle [60, 460+y], 10
      text "#{i+13}.      A       B      C      D",
                :size => 13 , :align => :right      
     end
  end
end

 #draw_  :at => [0, 565],
  
#    data=[
#      ["1.", "A      B      C      D","","14.","A      B      C      D"],
#      ["2.","A      B      C      D","","15.","A      B      C      D"],
#      ["3.","A      B      C      D","","16.","A      B      C      D"],
#      ["4.","A      B      C      D","","17.","A      B      C      D"],
#      ["5.","A      B      C      D","","18.","A      B      C      D"],
 #     ["6.","A      B      C      D","","19.","A      B      C      D"],
 #     ["7.","A      B      C      D","","20.","A      B      C      D"],
#      ["8.","A      B      C      D","","21.","A      B      C      D"],
#      ["9.","A      B      C      D","","22.","A      B      C      D"],
 #     ["10.","A      B      C      D","","23.","A      B      C      D"],
#      ["11.","A      B      C      D","","24.","A      B      C      D"],
#      ["12.","A      B      C      D","","25.","A      B      C      D"],
#      ["13.","A      B      C      D","","",""]
 #   ]

#    table data,:column_widths => { 0 => 40, 1 => 110, 2 =>50, 3 => 40, 4 => 110}, 
#  :cell_style => {:align => :center, :border_width => 0, :padding => [7,0,7,0] }
    move_down(60)
    font_size(8)

formatted_text_box [ { :text=> "LifeSavers, Inc.
39 Plymouth Street, Fairfield, NJ 07004
Phone: 973-244-9111 / www.lifesaversinc.com
Your instructor is affiliated with LifeSavers, Inc.
for the purpose of CPR and First Aid Training. LifeSavers, Inc.
"}], :at => [0, 100],:align=>:center
    

#########################################################################################################
#########################################################################################################
    start_new_page(:left_margin => 15, :right_margin => 15, :bottom_margin=>20, :top_margin=>40, :layout => :landscape )


    # Fonts
    font_size(8)

    #Make Footer
    font_size(11) {text "BLS FOR HEALTHCARE PROVIDERS – SKILLS TESTING SHEET", :style => :bold, :align => :center}

    move_down(10)

    text "Name:_________________________________________________________ Phone:_______________________________________ Course Location:_____________________________________"
    move_down(12)
    text "Address:__________________________________________________________  City:___________________________________________________ State:_____________ Zip:__________________ "
    move_down(12)
    text " E‐Mail Address:__________________________________________________________"
    move_down(10)

    #Create First Table ############################################################################

    font_size(12) {text "1‐ and 2‐Rescuer Adult BLS with AED Skills Testing", :style => :bold}
    move_down(5)

    #Create First Table ############################################################################

    font_size(7)
    #cell_1 = make_cell(cells.style(:background_color= >"D4D4D4"))

    #---------------------------------------

    data = [
      ['CPR Skills (circle one):      Pass        Needs Remediation 
AED Skills (circle one):      Pass        Needs Remediation ']]

    table data,
  :column_widths => { 0 => 372},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :align=>:center }
    #---------------------------------------

    data = [
      ['Skill 
Step', 'Critical Performance Criteria', '√√ if done correctly' ]]
    table data,
      :column_widths => { 0 => 22, 1 => 280, 2 => 70},
    #  :position => :left,
      :cell_style =>{:padding => [3, 3, 0, 0],:align=> :center, :text_color =>"ffffff", :background_color => "000000", :font_style => :bold, :border_color=>"ffffff" }
    #---------------------------------------

    data = [
      ['<b>1‐Rescuer Adult BLS Skills Evaluation</b>
During this first phase, evaluate the first rescuer’s ability to initiate BLS and delivery high‐quality CPR for 5 cycles." ']]

    table data,
  :column_widths => { 0 => 372},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

     # ============ inline Table 1 ==============================================

    data=[ ["GIVES HIGH-QUALITY CPR:"],
      ["- Correct compression HAND PLACEMENT"],
      ["- ADEQUATE RATE: At least 100/min (ie, delivers each set of 30 chest compressions in 18 seconds or less)"],
      ["- ADEQUATE DEPTH: Delivers compressions at least 2 inches in depth 
        (at least 23 out of 30)"],
      ["- ALLOWS COMPLETE CHEST RECOIL (at least 23 out of 30)"],
      ["- MINIMIZES INTERRUPTIONS: Gives 2 breaths with pocket mask in less 
        than 10 seconds"]]
        
    inner_table1 = make_table(data, :column_widths => { 0 => 280},
  :cell_style =>{:padding => 1,:inline_format => true, :border_width => 0.5 })
  
  # ============ inline Table 2 ==============================================
    data=[ [".","."],
      ["<i>Cycle 1:</i>",""],
      ["<i>Cycle 2:</i>
        .", "Time:"],
      ["<i>Cycle 3:</i>
        .",""],
      ["<i>Cycle 4:</i>",""],
      ["<i>Cycle 5:</i>
        .",""]]
    
    inner_table2 = make_table(data, :column_widths => { 0 => 35, 1=>35},
    :cell_style =>{:inline_format => true, :border_width => 0.2, :padding => 1}  
    )do
      column(0).style :align => :center, :background_color => "D3D3D3"
      row(0).style :align => :center, :background_color => "949494"
    end
    
    # ============ inline Table 3 ==============================================
    data=[ ["<i>Cycle 1:</i>","<i>Cycle 2:</i>"],
      [".
        .", ""],
      [".","."]]
      
    inner_table3 = make_table(data, :column_widths => { 0 => 35, 1=>35},
    :cell_style =>{:inline_format => true, :border_width => 0.2, :padding => 1}  
    )do
     row(0).style :align => :center, :background_color => "D7D7D7"
    end
    
    # ============ inline Table 4 ==============================================
    data=[ ["Both rescuers RESUME HIGH-QUALITY CPR immediately after shock delivery:"],
      ["- SECOND RESCUER gives 30 compressions immediately after shock delivery 
        (for 2 cycles) "],
      ["- FIRST RESCUER successfully delivers 2 breaths with bag-mask (for 2 cycles) "]
    ]
        
    inner_table4 = make_table(data, :column_widths => { 0 => 280},
  :cell_style =>{:padding => 1,:inline_format => true, :border_width => 0.5 })
    
    
    
    data = [
      ["1", "ASSESSES: Checks for response and for no breathing or no normal breathing, only gasping (at least 5 seconds but no more than 10 seconds)  ","" ],
      ["2", 'ACTIVATES emergency response system',""  ],
      ["3", 'Checks for PULSE (no more than 10 seconds)',"" ],
      ["4", inner_table1 ,inner_table2]]
      
      

    table data,
  :column_widths => { 0 => 22, 1 => 280, 2 => 70},
  :position => :left,
  :cell_style => {:padding =>0, :border_width => 0.5, :padding => 0 } do
      row(0).style :align => :center
      column(0).style :align => :center
    end

    #---------------------------------------

    data = [
      ['<b>Second Rescuer AED Skills Evaluation and SWITCH </b>
During this next phase, evaluate the second rescuer’s ability to use the AED and both rescuers’ abilities to switch roles. ']]

    table data,
  :column_widths => { 0 => 372},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

    #---------------------------------------
    data = [
      ["5", " DURING FIFTH SET OF COMPRESSIONS: Second rescuer arrives with AED 
        and bag-mask device, turns on AED, and applies pads" ,"" ],
      ["6", 'First rescuer continues compressions while second rescuer turns on AED 
        and applies pads' ,"" ],
      ["7", 'Second rescuer clears victim, allowing AED to analyze – RESCUERS SWITCH',"" ],
      ["8", 'If AED indicates a shockable rhythm, second rescuer clears the victim again and delivers shock. ',""]]
    table data,
  :column_widths => { 0 => 22, 1 => 280, 2 => 70},
  :position => :left,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 2 } do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    #------------------------------
    data = [
      ['<b>First Rescuer Bag‐Mask Ventilation </b>
During this next phase, evaluate the first rescuer’s ability to give breaths with a bag‐mask.']]

    table data,
  :column_widths => { 0 => 372},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }
    #---------------------------------------

    data = [
      ["9", inner_table4,inner_table3 ]
    ]

    table data,
  :column_widths => { 0 => 22, 1 => 280, 2 => 70},
  :position => :left,
  :cell_style => {  :border_width => 0.5, :padding => 0 }
  
    #---------------------------------------

    data = [
      ['<b>AFTER 2 CYCLES, STOP THE EVALUATION </b>']]

    table data,
  :column_widths => { 0 => 372},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :align=>:center }
    #---------------------------------------

    #-##########################################################################################################-
    #Create Second Table  ######################################################################################
    #-##########################################################################################################-
    move_up(365)

    formatted_text_box [ { :text=> "1‐ and 2‐Rescuer Infant BLS Skills Testing ",:styles => [:bold], :size => 12 }], :at => [380, 490]
    #font_size(11) text "1‐ and 2‐Rescuer Infant BLS Skills Testing ", :style => :bold, :position=>380
    font_size(7)
    #cell_1 = make_cell(cells.style(:background_color= >"D4D4D4"))

    #---------------------------------------

    data = [
      ['1‐Rescuer BLS and CPR Skills (circle one):         Pass         Needs Remediation
2‐Rescuer CPR Skills                                                                                     .
.    Bag-Mask (circle one):                                    Pass           Needs Remediation
.                     2 Thumb-Encircling Hands (circle one):         Pass       Needs Remediation  ']]

    table data,
  :column_widths => { 0 => 372},
  :position => 382,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :align=>:center }
    #---------------------------------------

    data = [
      ['Skill 
Step', 'Critical Performance Criteria', '√ if done correctly' ]]
    table data,
      :column_widths => { 0 => 22, 1 => 280, 2 => 70},
      :position => 382,
      :cell_style =>{:padding => [3, 3, 0, 0],:align=> :center, :text_color =>"ffffff", :background_color => "000000", :font_style => :bold, :border_color=>"ffffff" }
    #---------------------------------------

    data = [
      ['<b>1‐Rescuer Adult BLS Skills Evaluation</b>
During this first phase, evaluate the first rescuer’s ability to initiate BLS and delivery high‐quality CPR for 5 cycles." ']]

    table data,
  :column_widths => { 0 => 372},
  :position =>382,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

    #-------------------------------------
   
    data = [
      ["1", "ASSESSES: Checks for response and for no breathing or only gasping
        at least 5 seconds but no more than 10 seconds) ","" ],
      ["2", 'Sends someone to ACTIVATE emergency response system',""  ],
      ["3", 'Checks for PULSE (no more than 10 seconds)',"" ],
      ["4", inner_table1 , inner_table2]]

    table data,
  :column_widths => { 0 => 22, 1 => 280, 2 => 70},
  :position => 382,
  :cell_style => {:padding =>0, :border_width => 0.5, :padding =>0 }do
      column(0).style :align => :center
    end
    #---------------------------------------

    data = [
      ['<b>2‐Rescuer CPR and SWITCH</b>
During this next phase, evaluate the FIRST RESCUER’S ability to give breaths with a bag‐mask and give compressions by using the 2 thumb‐encircling hands technique.  Also evaluate both rescuers’ abilities to switch roles ']]

    table data,
  :column_widths => { 0 => 372},
  :position => 382,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

   # ============ inline Table 5 ==============================================
    data=[ ["Both rescuers RESUME HIGH‐QUALITY CPR:"],
      ["- SECOND RESCUER gives 15 compressions in 9 seconds or less by using 2 thumb-
encircling hands technique (for 2 cycles)  "],
      ["- FIRST RESCUER successfully delivers 2 breaths with bag-mask (for 2 cycles)  "]
    ]
        
    inner_table5 = make_table(data, :column_widths => { 0 => 280},
  :cell_style =>{:padding => 2,:inline_format => true, :border_width => 0.5 })
    
    # ============ inline Table 6 ==============================================
   data=[ ["<i>Cycle 1:</i>","<i>Cycle 2:</i>"],
  ["<b>X</b>", "<b>X</b>
    ."],
      [".","."]]
      
    inner_table6 = make_table(data, :column_widths => { 0 => 35, 1=>35},
    :cell_style =>{:inline_format => true, :border_width => 0.2, :padding => 2}  
    )do
     row(0).style :align => :center, :background_color => "D7D7D7"
    row(1).style :align => :center, :background_color => "949494"
    end
    
    #---------------------------------------
    data = [
      ["5", "DURING FIFTH SET OF COMPRESSIONS: Second rescuer arrives with and 
        bag-mask device. RESCUERS SWITCH ROLES." ,"" ],
      ["6", inner_table5 , inner_table6 ]
     ]
    table data,
  :column_widths => { 0 => 22, 1 => 280, 2 => 70},
  :position => 382,
  :cell_style => { :border_width => 0.5, :padding => 0 } do
      column(0).style :align => :center
    end

    #------------------------------
    data = [
      ['<b>AFTER 2 CYCLES, PROMPT RESCUERS TO SWITCH ROLES']]

    table data,
  :column_widths => { 0 => 372},
  :position => 382,
  :cell_style =>{:align=>:center, :inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }
   
   # ============ inline Table 7 ==============================================
    data=[ ["Both rescuers RESUME HIGH-QUALITY CPR:"],
      ["- FIRST RESCUER gives 15 compressions in 9 seconds or less 
        by using 2 thumb-encircling hands technique (for 2 cycles) "],
      ["- SECOND RESCUER successfully delivers 2 breaths with bag-mask (for 2 cycles)   "]
    ]
        
    inner_table7 = make_table(data, :column_widths => { 0 => 280},
  :cell_style =>{:padding => 3,:inline_format => true, :border_width => 0.5 })
    
   # ============ inline Table 8 ==============================================
   data=[ ["<i>Cycle 1:</i>","<i>Cycle 2:</i>"],
  [".
    ","."],    
  ["X", "X"] ]
      
    inner_table8 = make_table(data, :column_widths => { 0 => 35, 1=>35},
    :cell_style =>{:inline_format => true, :border_width => 0.2, :padding => 3}  
    ) do
     row(0).style :align => :center, :background_color => "D7D7D7"
    row(2).style :align => :center, :background_color => "949494"
    end
    
     #------------------------------
    data = [
      ["7", inner_table7, inner_table8 ]
    ]

    table data,
  :column_widths => { 0 => 22, 1 => 280, 2 => 70},
  :position => 382,
  :cell_style => {:border_width => 0.5, :padding => 0 } do
      column(0).style :align => :center
   end
    #---------------------------------------

    data = [
      ['<b>AFTER 2 CYCLES, STOP THE EVALUATION </b>']]

    table data,
  :column_widths => { 0 => 372},
  :position => 382,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :align=>:center }
  
    #---------------------------------------
#-##########################################################################################################-
    #Create 3-d Table  ######################################################################################
    #-##########################################################################################################-
    move_down ( 15)
   
    data = [
      ['If the student completes all steps successfully (a  in each box to the right of the Critical Performance Criteria), the student passed this scenario. 
-  If the student does not complete all steps successfully (as indicated by a blank box to the right of any of the Critical Performance Criteria), give the form to the student for review as part of the student’s remediation. 
-  After reviewing the form, the student will give the form to the instructor who is reevaluating the student.  The student will reperform the entire scenario, and the instructor will notate the reevaluation on this same form. 
-  If the reevaluation is to be done at a different time, the instructor should collect this sheet before the student leaves the classroom.']]

    table data,
  :column_widths => { 0 => 750},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5 }
    
  data = [
      ['

Instructors Signature:________________________________________
 
Print Instructors Name:_______________________________________
 
Date:_______________________________'," Remediation (if needed): 
 
Instructors Signature:________________________________________
 
Print Instructors Name:_______________________________________
 
Date:_______________________________ " , "


39 Plymouth Street, Fairfield, NJ 07004 
Phone: 973‐244‐9111 / www.lifesaversinc.com 
Your instructor is affiliated with LifeSavers, Inc. 
for the purpose of CPR and First Aid Training. " ]]

    table data,
  :column_widths => { 0 => 250, 1 => 250, 2 => 250},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5,:align=> :center }
    
    font_size(10)
    formatted_text_box [ { :text=> creation_date}], :at => [80, 14]
    font_size(10)

    image "data/logo.png", :at => [540, 58], :scale => 0.6
    image "data/sign.png", :at => [140, 70], :scale => 0.4
#======== inserting date in the box 
    formatted_text_box [ { :text=> @name}], :at => [45, 532]
    formatted_text_box [ { :text=> @phone}], :at => [325, 532]
    formatted_text_box [ { :text=> @address}], :at => [45, 510]
    formatted_text_box [ { :text=> @city}], :at => [325, 510]
    formatted_text_box [ { :text=> @state}], :at => [570, 510]
    formatted_text_box [ { :text=> @zip}], :at => [640, 510]
    formatted_text_box [ { :text=> @cource_location}], :at => [550, 532]
    formatted_text_box [ { :text=> @e_mail}], :at => [65, 488]
    formatted_text_box [ { :text=> @instructor_name}], :at => [100, 30]

#########################################################################################
    #=====start_new_page===================================================================
#######################################################################################################
    start_new_page(:left_margin => 30, :right_margin => 20, :bottom_margin=>20, :top_margin=>40, :layout => :landscape )
    # Prawn::Document.generate("multi-layout.pdf", :layout => :landscape, :left_margin => 50, :right_margin => 50)
    # prawnto :prawn => {:page_layout => :landscape,:page_size => 'LEGAL', :left_margin => 50, :right_margin => 50}

    # Fonts
    font_size(8)

    #Make Footer
    font_size(11) {text "HEARTSAVER CPR AED - SKILLS TESTING SHEET", :style => :bold, :align => :center}

    move_down(10)

    text "Name:_________________________________________________________ Phone: _______________________________ Date: ___________________________________"
    move_down(12)
    text "Address:________________________________________________________ City: _____________________________ State: _________________ Zip: ____________"
    move_down(12)
    text "Course Location:_____________________________________________ E-Mail: ________________________________________________________________________"
    move_down(10)

    #Create First Table ############################################################################

    font_size(7)
    #cell_1 = make_cell(cells.style(:background_color= >"D4D4D4"))
    data = [
      ['Step', 'Critical Perfomans Step', 'Adult CPR AED
        if correct', 'Child CPR AED
         if correct' ]]
    table data,
      :column_widths => { 0 => 22, 1 => 210, 2 => 65, 3 => 65},
      :position => :left,
      :cell_style =>{:padding => [2, 1, 0, 0],:align=> :center, :text_color =>"ffffff", :background_color => "000000", :font_style => :bold }

    data = [
      ["1", "<b>Verbalizes that the scene is safe </b> ","" ,"" ],
      ["2", '<b>Checks for response - tap and shout</b>',"" ,"" ],
      ["3", '<b>Yells for help</i>',"" ,"" ],
      ["4", "<b>Tells someone to phone the emergency response number (or 911) and get an AED (for adult only) </i>" ,"" ,"" ],
      ["5", " <b><i>Checks for no breathing or only gasping</i></b>
              <i> Minimum 5 seconds; maximum 10 seconds </i>" ,"" ,"" ],
      ["6", '<b>Locates hand placement for compressions </b>
            <i>Moves clothes out of the way of the chest Lower half of the breastbone; 1 or 2 hands for child</i>' ,"" ,"" ],
      ["7", '<b>Delivers first set of compressions </b>
            <i>Gives 30 compressions in 18 seconds or less</i>',"" ,"" ],
      ["8", '<b>ADULT: Gives 2 breaths with a mask CHILD: Gives 2 breaths without a mask </b>
              <i>At least 1 breath results in visible chest rise Breaths given and compressions started within 10 seconds</i> ',"" ,"" ],
      ["9", '<b>Delivers second set of compressions </b>
            <i>Gives at least 23 of 30 compressions in the correct chest location</i>',"" ,"" ],
      ["10", '<b>ADULT: Gives 2 breaths with a mask CHILD: Gives 2 breaths without a mask </b>
            <i>At least 1 breath results in visible chest rise Breaths given and compressions started within 10 seconds</i>',"" ,"" ],
      ["11",'Instructor says, <b><i>"You have just completed 5 sets of compressions and breaths."</i></b>
            <b> Leaves to phone 911 and get an AED (for child only)</b>',"" ,"" ],
      ["12",  'Turns on the AED immediately after it arrives ',"" ,"" ]
    ]

    table data,
  :column_widths => { 0 => 22, 1 => 210, 2 => 65, 3 => 65},
  :position => :left,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 1 }do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    data = [
      ['The next step is done only with a manikin with a feedback device. If no device, STOP THE TEST']]

    table data,
  :column_widths => { 0 => 362},
  :position => :left,
  :cell_style =>{:padding => 2,:align=> :center,:border_width => 0.5, :background_color => "D4D4D4" }

    data = [
      ["13", '<b>Delivers third set of compressions of adequate depth </b>
          <i> Acceptable if at least 23 of 30 compressions indicate depth of at least 2 inches (adult) or about 2 inches (child)</i>',"" ,""]]
    table data,
  :column_widths => { 0 => 22, 1 => 210, 2 => 65, 3 => 65},
  :position => :left,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 1 }

    data = [[ 'STOP THE TEST', 'STOP THE TEST']]

    table data,
  :column_widths => { 0 => 65, 1 => 65},
  :position => 232,
  :cell_style => {  :border_width => 0.5, :padding => 1,:background_color => "D4D4D4"  }

    #Create Second Table  ######################################################################################
    move_up(295)

    data = [
      ['Step', 'Critical Perfomans Step', 'Infant CPR
√ if done correctly']]
    table data,
      :column_widths => { 0 => 22, 1 => 270, 2 => 65},
      :position => 380,
      :cell_style =>{:padding => [2, 1, 0, 0],:align=> :center, :text_color =>"ffffff", :background_color => "000000", :font_style => :bold }

    data = [
      ["1", "<b>Verbalizes that the scene is safe </b>","" ],
      ["2", '<b>Checks for response - tap and shout</b>',"" ],
      ["3", '<b>Yells for help</i>',"" ],
      ["4", " <b><i>Checks for no breathing or only gasping</i></b>
              <i> Minimum 5 seconds; maximum 10 seconds </i>" ,"" ],
      ["5", '<b>Locates hand placement for compressions </b>
            <i>Two fingers just below the nipple line on the breastbone </i>' ,"" ],
      ["6", '<b>Delivers first set of compressions </b>
            <i>Gives 30 compressions in 18 seconds or less</i>',"" ],
      ["7", '<b>Gives 2 breaths without a mask </b>
              <i>At least 1 breath results in visible chest rise
              Breaths given and compressions started within 10 seconds</i> ',"" ],
      ["8", '<b>Delivers second set of compressions </b>
            <i>Gives at least 23 of 30 compressions in the correct chest location</i>',"" ],
      ["9", '<b>Gives 2 breaths without a mask </b>
            <i>At least 1 breath results in visible chest rise
            Breaths given and compressions started within 10 seconds</i>',"" ],
      ["10",'Instructor says, <b><i>"You have just completed 5 sets of compressions and breaths."</i></b>
            <b> Verbalizes the need to leave to phone 911 </b>',"" ],
      ["12",  'Turns on the AED immediately after it arrives ',"" ]
    ]
    table data,
  :column_widths => { 0 => 22, 1 => 270, 2 => 65},
  :position => 380,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 1 }do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    data = [
      ['The next step is done only with a manikin with a feedback device designed to indicate when compressions are
about 1 ½ inches deep or indicate that chest recoil is complete.  If no feedback device, STOP THE TEST']]

    table data,
  :column_widths => { 0 => 357},
  :position => 380,
  :cell_style =>{:padding => 2,:align=> :center,:border_width => 0.5, :background_color => "D4D4D4" }

    data = [["13", '<b>Delivers third set of compressions of adequate depth </b>
          <i> Acceptable if at least 23 of 30 compressions indicate depth of at least 2 inches (adult) or about 2 inches (child)</i>',""]]

    table data,
  :column_widths => { 0 => 22, 1 => 270, 2 => 65},
  :position => 380,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 1 }

    data = [[ 'STOP THE TEST']]

    table data,
  :column_widths => { 0 => 65},
  :position => 672,
  :cell_style => {  :border_width => 0.5, :padding => 1,:background_color => "D4D4D4"  }

    #Create Third Table  ######################################################################################
    move_down(50)
    font_size(9)

    data = [
      ['Test age groups taught in this course.  Record all test results here.  Sign where indicated.']]

    table data,
  :column_widths => { 0 => 600},
  :position => 60,
  :cell_style =>{:padding => 3,:align=> :center,:border_width => 0.5 }

    data=[ [{:content => "<b>Adult CPR AED</b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table1 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 25 , :padding => [7,7,7,7],:border_width => 0.5 })

    data=[ [{:content => "<b>Child CPR AED</b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table2 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 25 , :padding => [7,7,7,7],:border_width => 0.5 })

    data=[ [{:content => "<b>Infant CPR</b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table3 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 25 , :padding => [7,7,7,7],:border_width => 0.5 })

    data = [  [".
    .       Test
    .   Summary", ".   PASS=above steps all done correctly
     .   NR=needs remediation
    .    Circle PASS or NR
    .  for each age group tested", inner_table1, inner_table2, inner_table3  ]]
    table data,
  :column_widths => { 0 => 70, 1=>170, 2=> 120, 3=> 120, 4=> 120},
  :position => 60,
  :cell_style =>{:padding => 0,:border_width => 0.5 }

    font_size(7)
    data = [
      ['


Instructor signature affirms that
skills tests were done according to
AHA Guidelines.

Save this sheet with the course
record.', ".
instructor Signature:___________________________________________

Instructors                                                                                          .
       Name:______________________________________________

         Date:_________________________________________________" , "


39 Plymouth Street, Fairfield, NJ 07004
Phone: 973-244-9111 / www.lifesaversinc.com
Your instructor is affiliated with LifeSavers, Inc.
for the purpose of CPR and First Aid Training. " ]]

    table data,
  :column_widths => { 0 => 160, 1=> 260, 2=> 180},
  :position => 60,
  :cell_style =>{:padding => 3,:align=> :center,:border_width => 0.5 }

    font_size(10)
    formatted_text_box [ { :text=> creation_date}], :at => [300, 32]
    font_size(10)
    formatted_text_box [ { :text=> creation_date}], :at => [500, 532]
    formatted_text_box [ { :text=> @name}], :at => [45, 532]
    formatted_text_box [ { :text=> @phone}], :at => [340, 532]
    formatted_text_box [ { :text=> @address}], :at => [45, 510]
    formatted_text_box [ { :text=> @city}], :at => [325, 510]
    formatted_text_box [ { :text=> @state}], :at => [480, 510]
    formatted_text_box [ { :text=> @zip}], :at => [550, 510]
    formatted_text_box [ { :text=> @cource_location}], :at => [70, 488]
    formatted_text_box [ { :text=> @e_mail}], :at => [325, 488]
    formatted_text_box [ { :text=> @instructor_name}], :at => [300, 50]
   
   image "data/logo.png", :at => [500, 76], :scale => 0.6
    image "data/sign.png", :at => [340, 85], :scale => 0.4

    #Second page ==================================================================================
    #=========================================================================================================

    start_new_page(:left_margin => 30, :right_margin => 20, :layout => :landscape )

    font_size(8)

    #Make Footer
    font_size(11) {text "HEARTSAVER FIRST AID - SKILLS TESTING SHEET ", :style => :bold, :align => :center}

    move_down(10)

    text "Name:_________________________________________________________ Phone: _______________________________ Date: ___________________________________"
    move_down(12)
    text "Address:________________________________________________________ City: _____________________________ State: _________________ Zip: ____________"
    move_down(12)
    text "Course Location:_____________________________________________ E-Mail: ________________________________________________________________________"
    move_down(10)

    #Create First Table ############################################################################

    font_size(7)
    #cell_1 = make_cell(cells.style(:background_color= >"D4D4D4"))
    data = [
      ['Step', 'Critical Perfomans Step', '√√ if done correctly' ]]
    table data,
      :column_widths => { 0 => 22, 1 => 270, 2 => 70},
      :position => :left,
      :cell_style =>{:padding => [3, 3, 0, 0],:align=> :center, :text_color =>"ffffff", :background_color => "000000", :font_style => :bold }
    #---------------------------------------

    data = [
      ['<b>Removing Gloves</b>
Instructor tells student, "EMS has arrived and takes over.  You may now remove your gloves." ']]

    table data,
  :column_widths => { 0 => 362},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

    #-------------------------------------
    data = [
      ["1", "Removes gloves by gripping one glove on the outside near the cuff and peels
it off, inside out ","" ],
      ["2", 'Cups the inside-out glove with the gloved hand',""  ],
      ["3", 'Uses 2  fingers of the bare hand near the cuff to peel the second glove off,
with the first glove inside it ',"" ],
      ["4", "Verbalizes the need to dispose of gloves properly" ,""]]

    table data,
  :column_widths => { 0 => 22, 1 => 270, 2 => 70},
  :position => :left,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 2 } do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    #---------------------------------------
    data = [
      ["."]]

    table data,
  :column_widths => { 0 => 362},
  :position => :left,
  :cell_style =>{:padding => 2,:align=> :center,:border_width => 0.5 }

    #-------------------------------------
    data = [
      ['<b>Find the Problem </b>
Instructor tells student, <b><i> "You will demonstrate finding the problem for a person who is sick or injured.  The
person will act and respond as a person who is actually sick or injured.  You find a coworker lying on the floor.
You may begin."</i></b> ']]

    table data,
  :column_widths => { 0 => 362},
  :position => :left,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

    #---------------------------------------
    data = [
      ["1", " <b>Verbalizes that the scene is safe</b>" ,"" ],
      ["2", '<b>Verbalizes putting on gloves </b>' ,"" ],
      ["3", '<b>Checks for response - tap and shout  </b>
            <i>If the sick or injured person does not act accordingly, the instructor tells the
student,</i> <b><i>"The person does not move or respond in any way when you tap
and shout."</i></b>',""],
      ["4", '<b>Tells someone to phone the emergency response number (or 911) and get an AED</b> ',""],

      ["5", '<b>Checks for no breathing or only gasping </b>
        <i>if the student indicates that the person is not breathing, the instructor corrects
the student by saying, <b> "The person is breathing."</b></i>',"" ],
      ["6", "<bLooks for obvious signs of injury</b>" ,"" ],
      ["7",'<b>Verbalizes checking for medical identification jewelry</b>',"" ]
    ]

    table data,
  :column_widths => { 0 => 22, 1 => 270, 2 => 70},
  :position => :left,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 2 }do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    #------------------------------

    data = [[ 'STOP THE TEST']]

    table data,
  :column_widths => { 0 => 70},
  :position => 292,
  :cell_style => {  :border_width => 0.5, :padding => 2,:background_color => "D4D4D4"  }

    #---------------------------------
    #Create Second Table  ######################################################################################
    move_up(300)

    #cell_1 = make_cell(cells.style(:background_color= >"D4D4D4"))
    data = [
      ['Step', 'Critical Perfomans Step', '√√ if done correctly' ]]
    table data,
      :column_widths => { 0 => 22, 1 => 270, 2 => 70},
      :position => 372,
      :cell_style =>{:padding => [3, 3, 0, 0],:align=> :center, :text_color =>"ffffff", :background_color => "000000", :font_style => :bold }
    #---------------------------------------

    data = [
      ['<b>Using an Epinephrine Pen</b>
Instructor tells student, <b><i>"A coworker is having a severe allergic reaction, has an epinephrine pen, and needs
help using it.  You have completed all previous steps and are now ready to use the epinephrine pen.  Show the
steps for using the epinephrine pen."</i></b> ']]

    table data,
  :column_widths => { 0 => 362},
  :position => 372,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

    #-------------------------------------
    data = [
      ["1", "<b>Holds the epinephrine pen in the fist while not touching either end </b> ","" ],
      ["2", '<b>Takes off the safety cap</b>',""  ],
      ["3", " <b>Presses the epinephrine pen firmly against the outer side of the person's
thigh, halfway between the hip and knee, and holds in place for about 10
seconds.</b>", "" ],
      ["4", "Removes the epinephrine pen by pulling the pen straight out from the leg" ,""]]

    table data,
  :column_widths => { 0 => 22, 1 => 270, 2 => 70},
  :position => 372,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 2 }do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    #---------------------------------------
    data = [
      ["."]]

    table data,
  :column_widths => { 0 => 362},
  :position => 372,
  :cell_style =>{:padding => 2,:align=> :center,:border_width => 0.5 }

    #-------------------------------------
    data = [
      ['<b>Stopping Bleeding and Bandaging </b>
Instructor tells student, <b><i>  "You will demonstrate stopping bleeding and then bandaging a small cut on this
person`s forearm.  You have completed all previous steps and are now ready to begin." </i></b> ']]

    table data,
  :column_widths => { 0 => 362},
  :position => 372,
  :cell_style =>{:inline_format => true, :padding => 2,:border_width => 0.5, :background_color => "D4D4D4" }

    #---------------------------------------
    data = [
      ["1", " <b>Have the person place pressure of the cut with clean dressings while the
student puts on gloves </b>" ,"" ],
      ["2", '<b>Verbalizes putting on gloves</b>' ,"" ],
      ["3", '<b>Applies pressure to the bleeding area </b>
           After about 15 seconds, the instructor tells the student <b><i>"You can now see blood
on the dressing. The bleeding is not stopping."</i></b>',""],
      ["4", '<b>Tells someone to phone the emergency response number (or 911) and get an AED</b> ',""],
      ["5", '<b>Adds more dressings and presses harder to stop the bleeding</b>
        After about 15 seconds, the instructor tells the students <b><i>  "The bleeding has
stopped." </i></b>',"" ],
      ["6", "<b>Applies a bandage over the dressings</b>" ,"" ]
    ]

    table data,
  :column_widths => { 0 => 22, 1 => 270, 2 => 70},
  :position => 372,
  :cell_style => { :inline_format => true, :border_width => 0.5, :padding => 2 }  do
      row(0).style :align => :center
      column(0).style :align => :center
      column(1).style :align => :left
      column(2).style :align => :center
    end

    #_________________________________________

    #------------------------------

    data = [[ 'STOP THE TEST']]

    table data,
  :column_widths => { 0 => 70},
  :position => 664,
  :cell_style => {  :border_width => 0.5, :padding => 2,:background_color => "D4D4D4"  }

    #---------------------------------
    #Create Third Table  ######################################################################################
    move_down(10)
    font_size(9)

    data = [
      ['Test Summary']]

    table data,
  :column_widths => { 0 => 600},
  :position => 60,
  :cell_style =>{:padding => 3,:align=> :center,:border_width => 0.5 }

    data=[ [{:content => "<b>Removing Gloves</b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table1 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 27 , :padding => [7,7,7,7],:border_width => 0.5 })

    data=[ [{:content => "<b>Finding the Problem</b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table2 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 27 , :padding => [7,7,7,7],:border_width => 0.5 })

    data=[ [{:content => "<b>Epinephrine Pen</b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table3 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 27 , :padding => [7,7,7,7],:border_width => 0.5 })

    data=[ [{:content => "<b>Bleeding </b>", :colspan => 2}],
      [{:content => "PASS",:padding => 4 },"NR"]]
    inner_table4 = make_table(data, :column_widths => { 0 => 60, 1=>60},
  :cell_style =>{:inline_format => true,:align=> :center, :height => 27 , :padding => [7,7,7,7],:border_width => 0.5 })

    data = [  ["PASS = above steps all done correctly
NR = needs remediation
.       Circle PASS or NR
.   for each age group tested", inner_table1, inner_table2, inner_table3, inner_table4  ]]
    table data,
  :column_widths => { 0 => 120, 1=>120, 2=> 120, 3=> 120, 4=> 120},
  :position => 60,
  :cell_style =>{:padding => 0,:border_width => 0.5 }

    font_size(7)
    data = [
      ['Instructor signature affirms that
skills tests were done according to
AHA Guidelines.

Save this sheet with the course
record.', ".
instructor Signature:_________________________________________________

Instructors                                                                                          .
       Name:_________________________________________________

         Date:_________________________________________________" , "


39 Plymouth Street, Fairfield, NJ 07004
Phone: 973-244-9111 / www.lifesaversinc.com
Your instructor is affiliated with LifeSavers, Inc.
for the purpose of CPR and First Aid Training. " ]]

    table data,
  :column_widths => { 0 => 120, 1=> 300, 2=> 180},
  :position => 60,
  :cell_style =>{:padding => 3,:align=> :center,:border_width => 0.5 }

    font_size(10)
    formatted_text_box [ { :text=> creation_date}], :at => [300, 34]
    font_size(10)
    formatted_text_box [ { :text=> creation_date}], :at => [500, 532]

    formatted_text_box [ { :text=> @name}], :at => [45, 532]
    formatted_text_box [ { :text=> @phone}], :at => [325, 532]
    formatted_text_box [ { :text=> @address}], :at => [45, 510]
    formatted_text_box [ { :text=> @city}], :at => [325, 510]
    formatted_text_box [ { :text=> @state}], :at => [480, 510]
    formatted_text_box [ { :text=> @zip}], :at => [550, 510]
    formatted_text_box [ { :text=> @cource_location}], :at => [70, 488]
    formatted_text_box [ { :text=> @e_mail}], :at => [325, 488]
    formatted_text_box [ { :text=> @instructor_name}], :at => [300, 52]


image "data/logo.png", :at => [500, 80], :scale => 0.6
image "data/sign.png", :at => [340, 90], :scale => 0.4

    #----------------------------------------------------------------------------


    #---------------------------------
    render

  end
end
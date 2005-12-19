<mf:forumHideDivision title="#{msgs.cdfm_discussion_forums}" id="_test_div">
  <mf:forum_bar_link id="create_forum" title="#{msgs.cdfm_new_forum}" value=" #{msgs.cdfm_new_forum} " action="#{ForumTool.processActionNewForum}" rendered="#{ForumTool.instructor}"/> &nbsp;
<%--  <mf:forum_bar_link id="organize_forum" title="#{msgs.cdfm_organize}" value=" #{msgs.cdfm_organize} " action="#{ForumTool.processActionOrganize}"/> &nbsp;
  <mf:forum_bar_link id="forum_stats" title="#{msgs.cdfm_statistic}" value=" #{msgs.cdfm_statistic} " action="#{ForumTool.processActionStatistics}"/> &nbsp;--%>
  <mf:forum_bar_link id="template_setting" title="#{msgs.cdfm_template_setting}" value=" #{msgs.cdfm_template_setting} " action="#{ForumTool.processActionTemplateSettings}" rendered="#{ForumTool.instructor}"/> &nbsp;

  <h:dataTable id="forums" width="100%" value="#{ForumTool.forums}" var="forum">
    <h:column >
    	<f:verbatim><div class="forumsRow"><div class="forumsRowLeft"></f:verbatim>
    		<h:graphicImage url="/images/lock.gif" alt="this forum is locked"  rendered="#{forum.locked == 'true'}"/>
			<h:outputText id="emptyspace" value="  " rendered="#{forum.locked == 'true'}"/>
								
			<h:commandLink action="#{ForumTool.processActionDisplayForum}"  value="#{forum.forum.title}" >
				<f:param value="#{forum.forum.id}" name="forumId"/>
			</h:commandLink>
			 <f:verbatim></div></f:verbatim>
			 <f:verbatim><div class="rightAlign"></f:verbatim>
				<h:commandLink action="#{ForumTool.processActionNewTopic}"  value="#{msgs.cdfm_new_topic}">
					<f:param value="#{forum.forum.id}" name="forumId"/>
				</h:commandLink>
				<f:verbatim>&nbsp;&nbsp;&nbsp;</f:verbatim>
				<h:commandLink action="#{ForumTool.processActionForumSettings}"  value="#{msgs.cdfm_forum_settings}" rendered="#{ForumTool.instructor}">
					<f:param value="#{forum.forum.id}" name="forumId"/>
				</h:commandLink>
			<f:verbatim></div></f:verbatim>
			<f:verbatim> </br></f:verbatim>
			 <h:outputText id="forum_desc" value="#{forum.forum.shortDescription}" />
			<f:verbatim></div></f:verbatim>
		 <h:dataTable id="topics" width="90%" value="#{forum.topics}" var="topic">
		    <h:column>
				<f:verbatim><div class="topicRows"></f:verbatim>
				<h:graphicImage url="/images/lock.gif" alt="this topic is locked"  rendered="#{topic.locked == 'true'}"/>
				<h:outputText id="emptyspace" value="  " rendered="#{topic.locked == 'true'}"/>
				
				<h:commandLink action="#{ForumTool.processActionDisplayTopic}" id="topic_title" value="#{topic.topic.title}">
					<f:param value="#{topic.topic.id}" name="topicId"/>
					<f:param value="#{forum.forum.id}" name="forumId"/>
				</h:commandLink>
				<h:outputText id="topic_msg_count55" value=" (#{topic.totalNoMessages} messages - #{topic.unreadNoMessages} unread)"/>
				
				<h:commandLink action="#{ForumTool.processActionTopicSettings}" id="topic_setting" styleClass="rightAlign" value="#{msgs.cdfm_topic_settings}" rendered="#{ForumTool.instructor}">
					<f:param value="#{topic.topic.id}" name="topicId"/>
					<f:param value="#{forum.forum.id}" name="forumId"/>
				</h:commandLink>
				<f:verbatim><br/></f:verbatim>
					<h:outputText id="topic_desc" value="#{topic.topic.shortDescription}" />
				<f:verbatim><br/></f:verbatim>
					<h:commandLink immediate="true" action="#{ForumTool.processActionToggleDisplayExtendedDescription}" rendered="#{topic.hasExtendedDesciption}" 
						id="topic_extended_show" value="#{msgs.cdfm_read_full_description}">
						<f:param value="#{topic.topic.id}" name="topicId_displayExtended"/>
						<f:param value="displayHome" name="redirectToProcessAction"/>
					</h:commandLink>
					<h:inputTextarea rows="5" cols="100" id="topic_extended_description" disabled="true" value="#{topic.topic.extendedDescription}" rendered="#{topic.readFullDesciption}"/>
					<f:verbatim><br/></f:verbatim>
					<h:commandLink immediate="true" action="#{ForumTool.processActionToggleDisplayExtendedDescription}" id="topic_extended_hide" 
						 value="#{msgs.cdfm_hide_full_description}" rendered="#{topic.readFullDesciption}">
						<f:param value="#{topic.topic.id}" name="topicId_hideExtended"/>
						<f:param value="displayHome" name="redirectToProcessAction"/>
					</h:commandLink>					
				<f:verbatim><hr/></div></f:verbatim>
				<h:dataTable id="messages" value="#{topics.messages}" var="message">
				    <h:column>
						<h:outputText id="message_title" value="#{message.message.title}"/>
						<f:verbatim><br/></f:verbatim>
						<h:outputText id="message_desc" value="#{message.message.shortDescription}" />
				    </h:column>
				</h:dataTable>
		    </h:column>
		</h:dataTable>
	</h:column>
  </h:dataTable>
</mf:forumHideDivision>
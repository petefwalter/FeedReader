public class FeedReader.article : GLib.Object {

	private string m_articleID;
	private string m_title;
	private string m_url;
	private string m_html;
	private string m_preview;
	private string m_feedID;
	private GLib.List<string> m_tags;
	private string m_author;
	private int m_unread;
	private int m_marked;
	private int m_sortID;
	private GLib.DateTime m_date;



	public article (string articleID, string title, string url, string feedID, int unread, int marked, string html, string preview, string author, GLib.DateTime date, int sortID, string tags) {
		m_articleID = articleID;
		m_title = title;
		m_url = url;
		m_html = html;
		m_preview = preview;
		m_feedID = feedID;
		m_author = author;
		m_unread = unread;
		m_marked = marked;
		m_sortID = sortID;
		m_date = date;
		m_tags = new GLib.List<string>();
		var tagArray = tags.split(",");
		foreach(string tag in tagArray)
		{
			m_tags.append(tag);
		}
	}

	public string getArticleID()
	{
		return m_articleID;
	}

	public string getTitle()
	{
		return m_title;
	}

	public string getHTML()
	{
		return m_html;
	}

	public void setHTML(string html)
	{
		m_html = html;
	}

	public string getPreview()
	{
		return m_preview;
	}

	public void setPreview(string preview)
	{
		m_preview = preview;
	}

	public string getAuthor()
	{
		return m_author;
	}

	public void setAuthor(string author)
	{
		m_author = author;
	}

	public string getURL()
	{
		return m_url;
	}

	public int getSortID()
	{
		return m_sortID;
	}

	public GLib.DateTime getDate()
	{
		return m_date;
	}

	public string getDateStr()
	{
		return m_date.format("%Y-%m-%d %H:%M:%S");
	}

	public string getDateNice()
	{
		var now = new GLib.DateTime.now_local();
		var now_year = now.get_year();
		var now_day = now.get_day_of_year();

		var date_year = m_date.get_year();
		var date_day = m_date.get_day_of_year();

		if(date_year == 1900)
		{
			return _("no date available");
		}
		else if(date_year == now_year)
		{
			if(date_day == now_day)
			{
				return _("Today") + m_date.format(" %H:%M");
			}
			else if(date_day == now_day-1)
			{
				return _("Yesterday") + m_date.format(" %H:%M");
			}
		}

		return m_date.format("%d.%m.%Y %H:%M");
	}

	public string getFeedID()
	{
		return m_feedID;
	}

	public int getUnread()
	{
		return m_unread;
	}

	public int getMarked()
	{
		return m_marked;
	}

	public string getTagString()
	{
		string tags = "";
		foreach(string tag in m_tags)
		{
			tags += tag + ",";
		}
		return tags;
	}

	public void addTag(string tag)
	{
		m_tags.append(tag);
	}
}

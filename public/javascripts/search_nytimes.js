var nytimes_api_key   = '26723c1a0aa515f73262631579d3f246:2:61147380';
var nytimes_base_url  = 'http://api.nytimes.com/svc/search/v1/article?';
var ten_days          = 864000;

function searchNYTimes(date) {
  var articles_div = $('#articles');
  articles_div.html('<center>Fetching news articles...<br /><img src="/images/loader.gif"></center>');

  $.get('/ny_times/search?date=' + date, function(data) {
    articles_div.html('');
    var articles = jQuery.parseJSON(data);

    articles_div.append('<table xstyle="width: 600px;">');
    
    for (var i = 0; i < 5 && i < articles['results'].length; i++) {
      article = articles['results'][i];
      articles_div.append(
        '<tr>'
          + '<td style="width: 30px">' + (i + 1) + '.</td>'
          + '<td>'
            + '<a href="' + article.url + '">' + article.title + '</a><br />'
            + article.body
            + '<br /><br />'
          + '</td>'
        + '</tr>'
      );

    articles_div.append('</table>');
    }
  });
}


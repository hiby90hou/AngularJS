import './commentItem.css';
import React from 'react';


class CommentItem extends React.Component {
  render () {
    let comment = this.props.comment;
    return (
      <li className="list-group-item">
        <div className="handle">
          <a href="javascript:;">删除</a>
        </div>
        <p className="user"><span >username</span><span>说:</span></p>
        <p className="centence">content</p>
      </li>
    );
  }
}

export default CommentItem;

    
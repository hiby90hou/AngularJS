import React from 'react';

class userGist extends React.Component {

		

	render() {
		const {userName, lastGistUrl} = this.props
		return (
			<div>
			{userName}'s last gist is <a href={lastGistUrl}>here</a>
			</div>
		)
	};
}

export default userGist;


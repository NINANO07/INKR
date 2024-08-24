function pagination(total, pageNum, pageSize){
	let totPage = (total % pageSize)==0 ? (total / pageSize) : (total / pageSize) + 1;
		if(pageNum > totPage) pageNum = 1;

	let blockSize = 3;
	let curBlock = (pageNum - 1) / blockSize;
	let lastBlock = (totPage - 1) / blockSize;
	
}
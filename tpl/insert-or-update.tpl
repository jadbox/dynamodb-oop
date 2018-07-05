
<h1>Insert on Duplicate Item Update</h1>

Handled as <a href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_UpdateItem.html" target="_blank">updateItem</a>.<br>



<br>
<div class="code">

	DynamoDB
		.table('users')
		.where('email').eq('test@test.com')
		.return(DynamoDB.UPDATED_OLD)
		.insert_or_update({
			password: 'qwert',
			firstname: 'Smith',
			number: 5,
			
			// increment by 5
			page_views: DynamoDB.add(5), 
			
			// nested attributes
			list: [5,'a', {}, [] ], 
			
			// push these elements at the end of the list (L)
			phones: DynamoDB.add([5,'a']), 
			
			// add to SS,
			string_set: DynamoDB.add(DynamoDB.SS(['ddd','eee'])), 
			
			// add to NS,
			number_set: DynamoDB.add(DynamoDB.NS([444,555])), 

			unneeded_attribute: DynamoDB.del(),
			
			// remove elements from stringSet
			unneeded_ss_items: DynamoDB.del(DynamoDB.SS(['ccc','ddd'])), 
			
			// remove elements from numberSet
			unneeded_ns_items: DynamoDB.del(DynamoDB.NS([111,444])), 
		}, function( err, data ) {

		});

</div>
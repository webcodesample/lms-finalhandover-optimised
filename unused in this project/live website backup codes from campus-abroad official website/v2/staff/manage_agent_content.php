<div class="d-flex justify-content-between mb-5">
<ul class="nav nav-underline fs-9">
	<li class="nav-item"><a class="nav-link <?=$profile?>" href="manage_agent.php?agent_id=<?=$_REQUEST['agent_id']?>&tab=profile">Profile</a></li>
	<li class="nav-item"><a class="nav-link <?=$bank?>" href="manage_agent.php?agent_id=<?=$_REQUEST['agent_id']?>&tab=bank">Bank</a></li>
	<li class="nav-item"><a class="nav-link <?=$ledger?>" href="manage_agent.php?agent_id=<?=$_REQUEST['agent_id']?>&tab=ledger">Wallet</a></li>
	<li class="nav-item"><a class="nav-link <?=$performance?>" href="manage_agent.php?agent_id=<?=$_REQUEST['agent_id']?>&tab=performance">Performance</a></li>
	<li class="nav-item"><a class="nav-link <?=$withdrawl_request?>" href="manage_agent.php?agent_id=<?=$_REQUEST['agent_id']?>&tab=withdrawl_request">Withdrawal Request</a></li>
</ul>
<div class="mt-2 fs-9 fw-bold">
<span class="text-warning">SA<?=$agent['id']?></span>
 - 
<span class="text-primary"><?=$agent['name']?></span>
</div>

<?php setGoBack('agent_list.php') ?>
</div>

<?php include_once($tab_content_page); ?>
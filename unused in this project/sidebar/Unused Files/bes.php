      <nav class="navbar navbar-vertical navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
          <!-- scrollbar removed-->
          <div class="navbar-vertical-content">
            <ul class="navbar-nav flex-column" id="navbarVerticalNav">

              <li class="nav-item">
                <!-- label-->
                <p class="navbar-vertical-label">Apps
                </p>
                <hr class="navbar-vertical-line" />

                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-CRM" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-CRM">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="pie-chart"></span></span><span class="nav-link-text">CRM</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-CRM">
                      <li class="nav-item"><a class="nav-link" href="../apps/crm/analytics.html">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Analytics</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="temp_leads.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Temp Leads</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="leads.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">URN Leads</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="callback_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Calls</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>

                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-LEADS" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-CRM">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="users"></span></span><span class="nav-link-text">URN Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-LEADS">
                      <?php include_once("lead_management_menu_items.php") ?>
                    </ul>
                  </div>
                </div>


                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link label-1" href="chat_list.php" role="button" data-bs-toggle="" aria-expanded="false">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span data-feather="message-square"></span></span><span class="nav-link-text-wrapper"><span class="nav-link-text">Chat</span></span>
                    </div>
                  </a>
                </div>
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-email" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-email">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="mail"></span></span><span class="nav-link-text">Email</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-email">
                      <li class="collapsed-nav-item-title d-none">Email
                      </li>
                      <li class="nav-item"><a class="nav-link" href="../apps/email/inbox.html">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Inbox</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="../apps/email/email-detail.html">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Email detail</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="../apps/email/compose.html">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Compose</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="navbar-vertical-footer">
          <button class="btn navbar-vertical-toggle border-0 fw-semibold w-100 white-space-nowrap d-flex align-items-center"><span class="uil uil-left-arrow-to-left fs-8"></span><span class="uil uil-arrow-from-right fs-8"></span><span class="navbar-vertical-footer-text ms-2">Collapsed View</span></button>
        </div>
      </nav>
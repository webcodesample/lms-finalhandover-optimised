        <div class="row gy-3 mb-4 justify-content-between">
          <div class="col-xxl-6">
            <h2 class="mb-2 text-body-emphasis">CRM Dashboard</h2>
            <h5 class="text-body-tertiary fw-semibold mb-4">Check your business growth in one place</h5>
            <div class="row g-3 mb-3">
              <div class="col-sm-6 col-md-4 col-xl-3 col-xxl-4">
                <div class="card h-100">
                  <div class="card-body">
                    <div class="d-flex d-sm-block justify-content-between">
                      <div class="border-bottom-sm border-translucent mb-sm-4">
                        <div class="d-flex align-items-center">
                          <div class="d-flex align-items-center icon-wrapper-sm shadow-primary-100" style="transform: rotate(-7.45deg);"><span class="fa-solid fa-phone-alt text-primary fs-7 z-1 ms-2"></span></div>
                          <p class="text-body-tertiary fs-9 mb-0 ms-2 mt-3">Outgoing call</p>
                        </div>
                        <p class="text-primary mt-2 fs-6 fw-bold mb-0 mb-sm-4">3 <span class="fs-8 text-body lh-lg">Leads Today</span></p>
                      </div>
                      <div class="d-flex flex-column justify-content-center flex-between-end d-sm-block text-end text-sm-start"><span class="badge badge-phoenix badge-phoenix-success fs-10 mb-2">+24.5%</span>
                        <p class="mb-0 fs-9 text-body-tertiary">Than Yesterday</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-xl-3 col-xxl-4">
                <div class="card h-100">
                  <div class="card-body">
                    <div class="d-flex d-sm-block justify-content-between">
                      <div class="border-bottom-sm border-translucent mb-sm-4">
                        <div class="d-flex align-items-center">
                          <div class="d-flex align-items-center icon-wrapper-sm shadow-info-100" style="transform: rotate(-7.45deg);"><span class="fa-solid fa-calendar text-info fs-7 z-1 ms-2"></span></div>
                          <p class="text-body-tertiary fs-9 mb-0 ms-2 mt-3">Outgoing meeting</p>
                        </div>
                        <p class="text-info mt-2 fs-6 fw-bold mb-0 mb-sm-4">12 <span class="fs-8 text-body lh-lg">This Week</span></p>
                      </div>
                      <div class="d-flex flex-column justify-content-center flex-between-end d-sm-block text-end text-sm-start"><span class="badge badge-phoenix badge-phoenix-warning fs-10 mb-2">+24.5%</span>
                        <p class="mb-0 fs-9 text-body-tertiary">Than last week</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            <?php include_once("top5_source.php") ?>
            </div>
          </div>
          <div class="col-xxl-6 mb-6">
            <h3>Contacts Created</h3>
            <p class="text-body-tertiary mb-1">Payment received across all channels</p>
            <div class="echart-contacts-created" style="min-height:270px; width:100%"></div>
          </div>

              <?php include_once("new_leads_by_source.php") ?>
              
            <?php include_once("new_urn_plus_leads.php"); ?>
          <div class="col-12 col-xxl-6">
            <div class="row align-items-start justify-content-between mb-4 g-3">
              <div class="col-auto">
                <h3>Ad Clicks</h3>
                <p class="text-body-tertiary lh-sm mb-0">Check effectiveness of your ads</p>
              </div>
              <div class="col-12 col-sm-4">
                <select class="form-select form-select-sm" id="select-ad-clicks-month">
                  <option>Mar 1 - 31, 2022</option>
                  <option>April 1 - 30, 2022</option>
                  <option>May 1 - 31, 2022</option>
                </select>
              </div>
            </div>
            <div class="echart-add-clicks-chart" style="min-height:385px;width:100%"></div>
          </div>
          <div class="col-12 col-xxl-6 mb-6 gy-0 gy-xxl-3">
            <div class="row align-items-start justify-content-between mb-4 g-3">
              <div class="col-auto">
                <h3>Deal Forecast<span class="fw-semibold">- $90,303</span></h3>
                <p class="text-body-tertiary mb-1">Show what you offer here</p>
              </div>
              <div class="col-12 col-sm-4">
                <select class="form-select form-select-sm" id="select-ad-forcast-month">
                  <option>Mar 1 - 31, 2022</option>
                  <option>April 1 - 30, 2022</option>
                  <option>May 1 - 31, 2022</option>
                </select>
              </div>
            </div>
            <div class="w-100">
              <div class="d-flex flex-start">
                <p class="mb-2 text-body-tertiary fw-semibold fs-9" style="width: 20.72%">$21.0k</p>
                <p class="mb-2 text-body-tertiary fw-semibold fs-9" style="width: 35.76%">$3.4k</p>
                <p class="mb-2 text-body-tertiary fw-semibold fs-9" style="width: 25.38%">$15.1k</p>
                <p class="mb-2 text-body-tertiary fw-semibold fs-9" style="width: 25.14%">$4.6k</p>
              </div>
              <div class="progress mb-3 rounded-3" style="height: 10px;">
                <div class="progress-bar border-end border-2 bg-primary-dark" role="progressbar" style="width: 20.72%" aria-valuenow="20.72" aria-valuemin="0" aria-valuemax="100" data-bs-toggle="tooltip" data-bs-placement="top" title="Appointment"></div>
                <div class="progress-bar border-end border-2" role="progressbar" style="width: 35.76%" aria-valuenow="35.76" aria-valuemin="0" aria-valuemax="100" data-bs-toggle="tooltip" data-bs-placement="top" title="Qualified"></div>
                <div class="progress-bar bg-success border-end border-2" role="progressbar" style="width: 25.38%" aria-valuenow="25.38" aria-valuemin="0" aria-valuemax="100" data-bs-toggle="tooltip" data-bs-placement="top" title="Closed Won"></div>
                <div class="progress-bar bg-info" role="progressbar" style="width: 25.14%" aria-valuenow="25.14" aria-valuemin="0" aria-valuemax="100" data-bs-toggle="tooltip" data-bs-placement="top" title="Contact Sent"></div>
              </div>
            </div>
            <h4 class="mt-4 mb-3">Deal Forecast by Owner </h4>
            <div class="border-top border-bottom-0" id="dealForecastTable" data-list='{"valueNames":["contact","appointment","qualified","closed-won","contact-sent"],"page":5}'>
              <div class="table-responsive scrollbar">
                <table class="table fs-9 mb-0">
                  <thead>
                    <tr>
                      <th class="sort border-end border-translucent white-space-nowrap align-middle ps-0 text-uppercase text-body-tertiary" scope="col" data-sort="contact" style="width:15%; min-width:100px">Contact</th>
                      <th class="sort border-end border-translucent align-middle text-end px-3 text-uppercase text-body-tertiary" scope="col" data-sort="appointment" style="width:15%; min-width:95px">
                        <div class="d-inline-flex flex-center"><span class="fa-solid fa-square fs-11 text-primary me-2" data-fa-transform="up-2"></span><span class="mb-0 fs-9">Appointment</span></div>
                      </th>
                      <th class="sort border-end border-translucent align-middle text-end px-3 text-uppercase text-body-tertiary" scope="col" data-sort="qualified" style="width:20%; min-width:100px">
                        <div class="d-inline-flex flex-center"><span class="fa-solid fa-square fs-11 text-primary-light me-2" data-fa-transform="up-2"></span><span class="mb-0 fs-9">Qualified</span></div>
                      </th>
                      <th class="sort border-end border-translucent align-middle text-end px-3 text-uppercase text-body-tertiary" scope="col" data-sort="closed-won" style="width:20%; min-width:100px">
                        <div class="d-inline-flex flex-center"><span class="fa-solid fa-square fs-11 text-success me-2" data-fa-transform="up-2"></span><span class="mb-0 fs-9">Closed Won</span></div>
                      </th>
                      <th class="sort align-middle text-end ps-3 text-uppercase text-body-tertiary" scope="col" data-sort="contact-sent" style="width:20%; min-width:100px">
                        <div class="d-inline-flex flex-center"><span class="fa-solid fa-square fs-11 text-info me-2" data-fa-transform="up-2"></span><span class="mb-0 fs-9">Contact Sent</span></div>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="list" id="table-deal-forecast-body">
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="contact border-end border-translucent align-middle white-space-nowrap py-2 ps-0 px-3"><a class="fw-semibold" href="#!">Carrie Anne</a></td>
                      <td class="appointment border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">1000</td>
                      <td class="qualified border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$1256</td>
                      <td class="closed-won border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$1200</td>
                      <td class="contact-sent border-end-0 align-middle white-space-nowrap text-end fw-semibold text-body ps-3 py-2">$1200</td>
                    </tr>
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="contact border-end border-translucent align-middle white-space-nowrap py-2 ps-0 px-3"><a class="fw-semibold" href="#!">Milind Mikuja</a></td>
                      <td class="appointment border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">558</td>
                      <td class="qualified border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$2531</td>
                      <td class="closed-won border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$2200</td>
                      <td class="contact-sent border-end-0 align-middle white-space-nowrap text-end fw-semibold text-body ps-3 py-2">$2200</td>
                    </tr>
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="contact border-end border-translucent align-middle white-space-nowrap py-2 ps-0 px-3"><a class="fw-semibold" href="#!">Stanley Drinkwater</a></td>
                      <td class="appointment border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">1100</td>
                      <td class="qualified border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$100</td>
                      <td class="closed-won border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$100</td>
                      <td class="contact-sent border-end-0 align-middle white-space-nowrap text-end fw-semibold text-body ps-3 py-2">$100</td>
                    </tr>
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="contact border-end border-translucent align-middle white-space-nowrap py-2 ps-0 px-3"><a class="fw-semibold" href="#!">Josef Stravinsky</a></td>
                      <td class="appointment border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">856</td>
                      <td class="qualified border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$326</td>
                      <td class="closed-won border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$265</td>
                      <td class="contact-sent border-end-0 align-middle white-space-nowrap text-end fw-semibold text-body ps-3 py-2">$265</td>
                    </tr>
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="contact border-end border-translucent align-middle white-space-nowrap py-2 ps-0 px-3"><a class="fw-semibold" href="#!">Roy Anderson</a></td>
                      <td class="appointment border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">1200</td>
                      <td class="qualified border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$1452</td>
                      <td class="closed-won border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$865</td>
                      <td class="contact-sent border-end-0 align-middle white-space-nowrap text-end fw-semibold text-body ps-3 py-2">$865</td>
                    </tr>
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="contact border-end border-translucent align-middle white-space-nowrap py-2 ps-0 px-3"><a class="fw-semibold" href="#!">Oscar Wilde</a></td>
                      <td class="appointment border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">1020</td>
                      <td class="qualified border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$950</td>
                      <td class="closed-won border-end border-translucent align-middle white-space-nowrap text-end fw-semibold text-body py-2 px-3">$1000</td>
                      <td class="contact-sent border-end-0 align-middle white-space-nowrap text-end fw-semibold text-body ps-3 py-2">$800</td>
                    </tr>
                  </tbody>
                  <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                    <td class="align-middle border-bottom-0 border-end border-translucent white-space-nowrap text-end fw-bold text-body-emphasis pt-2 lh-sm pb-0 px-3"> </td>
                    <td class="align-middle border-bottom-0 border-end border-translucent white-space-nowrap text-end fw-bold text-body-emphasis pt-2 lh-sm pb-0 px-3">4,744</td>
                    <td class="align-middle border-bottom-0 border-end border-translucent white-space-nowrap text-end fw-bold text-body-emphasis pt-2 lh-sm pb-0 px-3">$5,665</td>
                    <td class="align-middle border-bottom-0 border-end border-translucent white-space-nowrap text-end fw-bold text-body-emphasis pt-2 lh-sm pb-0 px-3">$4630</td>
                    <td class="border-bottom-0 align-middle white-space-nowrap text-end fw-bold text-body-emphasis pt-2 pb-0 ps-3">$4630</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="mx-lg-n4">
          <div class="row g-3 mb-9 mt-n7">
            <div class="col-xl-5">
              <div class="card h-100">
                <div class="card-body">
                  <h3>Lead Conversion</h3>
                  <p class="text-body-tertiary mb-0">Stages of deals &amp; conversion</p>
                  <div class="echart-lead-conversion" style="min-height: 250px;"></div>
                </div>
              </div>
            </div>
            <div class="col-xl-7">
              <div class="card h-100">
                <div class="card-body">
                  <h3>Revenue Target</h3>
                  <p class="text-body-tertiary">Country-wise target fulfilment</p>
                  <div class="echart-revenue-target-conversion" style="min-height: 230px;"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php include_once("footer_copyright.php") ?>
      </div>
      <div class="modal fade" id="searchBoxModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="true" data-phoenix-modal="data-phoenix-modal" style="--phoenix-backdrop-opacity: 1;">
        <div class="modal-dialog">
          <div class="modal-content mt-15 rounded-pill">
            <div class="modal-body p-0">
              <div class="search-box navbar-top-search-box" data-list='{"valueNames":["title"]}' style="width: auto;">
                <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
                  <input class="form-control search-input fuzzy-search rounded-pill form-control-lg" type="search" placeholder="Search..." aria-label="Search" />
                  <span class="fas fa-search search-box-icon"></span>

                </form>
                <div class="btn-close position-absolute end-0 top-50 translate-middle cursor-pointer shadow-none" data-bs-dismiss="search">
                  <button class="btn btn-link p-0" aria-label="Close"></button>
                </div>
                <div class="dropdown-menu border start-0 py-0 overflow-hidden w-100">
                  <div class="scrollbar-overlay" style="max-height: 30rem;">
                    <div class="list pb-3">
                      <h6 class="dropdown-header text-body-highlight fs-10 py-2">24 <span class="text-body-quaternary">results</span></h6>
                      <hr class="my-0" />
                      <h6 class="dropdown-header text-body-highlight fs-9 border-bottom border-translucent py-2 lh-sm">Recently Searched </h6>
                      <div class="py-2"><a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"><span class="fa-solid fa-clock-rotate-left" data-fa-transform="shrink-2"></span> Store Macbook</div>
                          </div>
                        </a>
                        <a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"> <span class="fa-solid fa-clock-rotate-left" data-fa-transform="shrink-2"></span> MacBook Air - 13″</div>
                          </div>
                        </a>

                      </div>
                      <hr class="my-0" />
                      <h6 class="dropdown-header text-body-highlight fs-9 border-bottom border-translucent py-2 lh-sm">Products</h6>
                      <div class="py-2"><a class="dropdown-item py-2 d-flex align-items-center" href="../apps/e-commerce/landing/product-details.html">
                          <div class="file-thumbnail me-2"><img class="h-100 w-100 fit-cover rounded-3" src="../assets/img/products/60x60/3.png" alt="" /></div>
                          <div class="flex-1">
                            <h6 class="mb-0 text-body-highlight title">MacBook Air - 13″</h6>
                            <p class="fs-10 mb-0 d-flex text-body-tertiary"><span class="fw-medium text-body-tertiary text-opactity-85">8GB Memory - 1.6GHz - 128GB Storage</span></p>
                          </div>
                        </a>
                        <a class="dropdown-item py-2 d-flex align-items-center" href="../apps/e-commerce/landing/product-details.html">
                          <div class="file-thumbnail me-2"><img class="img-fluid" src="../assets/img/products/60x60/3.png" alt="" /></div>
                          <div class="flex-1">
                            <h6 class="mb-0 text-body-highlight title">MacBook Pro - 13″</h6>
                            <p class="fs-10 mb-0 d-flex text-body-tertiary"><span class="fw-medium text-body-tertiary text-opactity-85">30 Sep at 12:30 PM</span></p>
                          </div>
                        </a>

                      </div>
                      <hr class="my-0" />
                      <h6 class="dropdown-header text-body-highlight fs-9 border-bottom border-translucent py-2 lh-sm">Quick Links</h6>
                      <div class="py-2"><a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"><span class="fa-solid fa-link text-body" data-fa-transform="shrink-2"></span> Support MacBook House</div>
                          </div>
                        </a>
                        <a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"> <span class="fa-solid fa-link text-body" data-fa-transform="shrink-2"></span> Store MacBook″</div>
                          </div>
                        </a>

                      </div>
                      <hr class="my-0" />
                      <h6 class="dropdown-header text-body-highlight fs-9 border-bottom border-translucent py-2 lh-sm">Files</h6>
                      <div class="py-2"><a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"><span class="fa-solid fa-file-zipper text-body" data-fa-transform="shrink-2"></span> Library MacBook folder.rar</div>
                          </div>
                        </a>
                        <a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"> <span class="fa-solid fa-file-lines text-body" data-fa-transform="shrink-2"></span> Feature MacBook extensions.txt</div>
                          </div>
                        </a>
                        <a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"> <span class="fa-solid fa-image text-body" data-fa-transform="shrink-2"></span> MacBook Pro_13.jpg</div>
                          </div>
                        </a>

                      </div>
                      <hr class="my-0" />
                      <h6 class="dropdown-header text-body-highlight fs-9 border-bottom border-translucent py-2 lh-sm">Members</h6>
                      <div class="py-2"><a class="dropdown-item py-2 d-flex align-items-center" href="../pages/members.html">
                          <div class="avatar avatar-l status-online  me-2 text-body">
                            <img class="rounded-circle " src="../assets/img/team/40x40/10.webp" alt="" />

                          </div>
                          <div class="flex-1">
                            <h6 class="mb-0 text-body-highlight title">Carry Anna</h6>
                            <p class="fs-10 mb-0 d-flex text-body-tertiary">anna@technext.it</p>
                          </div>
                        </a>
                        <a class="dropdown-item py-2 d-flex align-items-center" href="../pages/members.html">
                          <div class="avatar avatar-l  me-2 text-body">
                            <img class="rounded-circle " src="../assets/img/team/40x40/12.webp" alt="" />

                          </div>
                          <div class="flex-1">
                            <h6 class="mb-0 text-body-highlight title">John Smith</h6>
                            <p class="fs-10 mb-0 d-flex text-body-tertiary">smith@technext.it</p>
                          </div>
                        </a>

                      </div>
                      <hr class="my-0" />
                      <h6 class="dropdown-header text-body-highlight fs-9 border-bottom border-translucent py-2 lh-sm">Related Searches</h6>
                      <div class="py-2"><a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"><span class="fa-brands fa-firefox-browser text-body" data-fa-transform="shrink-2"></span> Search in the Web MacBook</div>
                          </div>
                        </a>
                        <a class="dropdown-item" href="../apps/e-commerce/landing/product-details.html">
                          <div class="d-flex align-items-center">

                            <div class="fw-normal text-body-highlight title"> <span class="fa-brands fa-chrome text-body" data-fa-transform="shrink-2"></span> Store MacBook″</div>
                          </div>
                        </a>

                      </div>
                    </div>
                    <div class="text-center">
                      <p class="fallback fw-bold fs-7 d-none">No Result Found.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

<%@include file="layout/left.jsp" %>
<div class="container-80 d-flex justify-content-around pt-5 ">
    <div class="card" 
         style="
         display: flex;
         flex-direction: row;
         width: 20rem;
         align-items: center;
         justify-content: flex-start;
         ">
        <div style="margin-left: 2rem;">      
            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-funnel-fill" viewBox="0 0 16 16">
                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2z"/>
            </svg>
        </div>
        <div style="margin-left: 2rem;">
            <h4>Category</h4>
            <div style="
                 display: flex;
                 flex-direction: row;
                 align-items: baseline;
                 justify-content: flex-start;
                 ">
                <h5 style="margin-bottom:0; margin-right: 1rem">Count: </h5>
                ${categoriesCount}
            </div>
        </div>
    </div>
    <div class="card" 
         style="
         display: flex;
         flex-direction: row;
         width: 20rem;
         align-items: center;
         justify-content: flex-start;
         ">
        <div style="margin-left: 2rem;">      
            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
            </svg>
        </div>
        <div  style="margin-left: 2rem;">
            <h4>User</h4>
            <div   style="
                   display: flex;
                   flex-direction: row;
                   align-items: baseline;
                   justify-content: flex-start;
                   "
                   >
                <h5 style="margin-bottom:0; margin-right: 1rem">Count: </h5>
                ${usersCount}
            </div>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
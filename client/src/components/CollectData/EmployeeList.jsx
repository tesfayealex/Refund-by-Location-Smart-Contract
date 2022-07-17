import React, {useEffect, useState} from 'react'


export default function EmployeeList({employeesLs}) {

    return (
    <div>
        <h3>Employee List</h3>
        <br />
        {
            employeesLs.length>0?(
                <table id="customers">
                    <thead>
                        <tr>
                            <th>ID</th> 
                            <th>Employee Name</th>
                            <th>Employee Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        {employeesLs.map(em=>
                            <tr key={em.id}>
                                <td>{em.id}</td>
                                <td>{em.name}</td>
                                <td>{em.public_address}</td>
                            </tr>
                            )}
                    </tbody>
                </table>
            ):(<p>
                ⚠️ Cannot find <span className="code">Employees</span>
              </p>)
        }
        
      </div>
  )
}

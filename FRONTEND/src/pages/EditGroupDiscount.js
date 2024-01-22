import React, {useEffect, useState} from 'react'
import Layout from '../components/Screens/Layout'

import { useDispatch, useSelector } from 'react-redux'
import { useNavigate } from 'react-router-dom'
import { getMe } from '../features/auth/authSlice'
import axios from 'axios'
import { useParams } from 'react-router-dom';


const EditGroupDiscount = ({props}) => {
  
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { isError } = useSelector((state) => state.auth);

  useEffect(() => {
    dispatch(getMe());
  }, [dispatch])

  useEffect(() => {
    if(isError) {
      navigate("/")
    }
  }, [isError, navigate
  ])

  const [groupname, setGroupname] = useState("");
  const [grouppourcentage, setGrouppourcentage] = useState("");


  const [msg, setMsg] = useState("");



  const { id } = useParams();
  const getGroupDiscount = async () => {
    const response = await axios.get(`${process.env.REACT_APP_BASE_URL}/groupdiscount/${id}`);
    setGroupname(response.data.name);
    setGrouppourcentage(response.data.pourcentage);
  }
  const updateGroupDiscount = async (e) => {
    e.preventDefault();
    try {
      await axios.patch(`${process.env.REACT_APP_BASE_URL}/groupdiscount/${id}`, {
        name: groupname,
        pourcentage: grouppourcentage,
      });
      navigate("/discount");
    } catch (error) {
      if(error.response) {
        setMsg(error.response.data.msg);
      }
    }
  }

  useEffect(() => {
    getGroupDiscount();
    updateGroupDiscount();

  }, [])

 
  return (
    <Layout>
        <div className='mt-10 ml-5'>
            <p className='font-bold text-3xl'>Discount Group</p>
            <p className='text-gray-400 text-2xl'>Edit Discount Group</p>
            <div className='bg-white h-[20rem] p-5  ml-1 mt-3 elevation'>
                <form onSubmit={updateGroupDiscount}>
                  
                  
                    <div className='mt-5'>
                      <label className='text-xl font-bold'>Name</label>
                      <input type="text" id="first_name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " 
                        value={groupname}
                        onChange={(e) => setGroupname(e.target.value)} 
                        required
                      />
                    </div>
                    <div className='mt-5'>
                      <label className='text-xl font-bold'>Pourcentage</label>
                      <input type="text" id="first_name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " 
                        value={grouppourcentage}
                        onChange={(e) => setGrouppourcentage(e.target.value)} 
                        required
                      />
                    </div>
                  
                  
                      <p className='text-sm text-center text-red'>{msg}</p>
                      <div className='flex flex-row  mt-3 mb-3'>
                        <button className='bg-blue-600 rounded text-gray-100 font-medium w-30 h-10 p-3 flex items-center justify-center' type="submit">
                          Update Discount Group
                        </button>
                        <button  className='bg-blue-600 rounded text-gray-100 font-medium w-20 h-10 p-3 flex items-center justify-center ml-5'>
                          Cancel
                        </button>
            </div>
                </form>
            </div>

        </div>
    </Layout>
  )
}

export default EditGroupDiscount
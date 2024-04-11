import React, { useEffect, useState } from 'react';
import Nav from './UpNAv'

export default function FilteredTable() {
    const [data, setData] = useState(null);
    // Obtener los parámetros de la URL
    const urlParams = new URLSearchParams(window.location.search);
    // Obtener un parámetro específico
    const param1 = urlParams.get('page');
    const param2 = urlParams.get('mag_type');
    const param3 = urlParams.get('per_page')

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (param1 && param2 && param3) {
                
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?page=${param1}&mag_type=${param2}&per_page=${param3}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                    //console.log(jsonData[0].data)

                }else if (param1 && param2) {
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?page=${param1}&mag_type=${param2}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }else if (param1 && param3) {
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?page=${param1}&per_page=${param3}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }else if (param2 && param3) {
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?mag_type=${param2}&per_page=${param3}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }else if (param1) {
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?page=${param1}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }else if (param2) {
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?mag_type=${param2}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }else if (param3) {
                    const response = await fetch(`http://127.0.0.1:3000/earthquakes.json?per_page=${param3}`);
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }else{
                    const response = await fetch('http://127.0.0.1:3000/earthquakes.json');
                    const jsonData = await response.json();
                    setData(jsonData[0].data);
                }
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };

        fetchData();
    }, []);
  return (
    <div className="w-full flex flex-col h-screen overflow-y-hidden">
        <Nav/>
      {/* Main Content */}
      <div className="w-full overflow-x-hidden border-t flex flex-col">
            <main className="w-full flex-grow p-6">
                <form className="flex justify-between items-center">
                    <div className="flex items-center space-x-4">
                        <label htmlFor="page" className="text-sm">Número de página:</label>
                        <input id="page" name="page" type="number" min="1" className="border rounded-md px-2 py-1" />
                    </div>
                    <div className="flex items-center space-x-4">
                        <label htmlFor="perPage" className="text-sm">Datos por página:</label>
                        <input id="per_page" name="per_page" type="number" min="1" max="1000" className="border rounded-md px-2 py-1" />
                    </div>
                    <div className="flex items-center space-x-4">
                        <label htmlFor="mag_type" className="text-sm">Magnitud:</label>
                        <select id="mag_type" name="mag_type" className="border rounded-md px-2 py-1" >
                            <option value=""></option>
                            <option value="md">md</option>
                            <option value="ml">ml</option>
                            <option value="ms">ms</option>
                            <option value="mw">mw</option>
                            <option value="me">me</option>
                            <option value="mi">mi</option>
                            <option value="mb">mb</option>
                            <option value="mlg">mlg</option>

                        </select>
                    </div>
                    <button type="submit" className="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-md">Consultar</button>
                </form>    
                <div className="w-full mt-12">
                    <p className="text-xl pb-3 flex items-center">
                        <i className="fas fa-list mr-3"></i> Latest Reports
                    </p>
                    <div className="bg-white overflow-auto">
                        <table className="min-w-full bg-white">
                            <thead className="bg-gray-800 text-white">
                                <tr>
                                    <th className="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">id</th>
                                    <th className="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">title</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">type</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">magnitude</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">Mag Type</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">place</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">time</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">tsunami</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">coordinates</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">external id</th>
                                    <th className="text-left py-3 px-4 uppercase font-semibold text-sm">external url</th>
                                </tr>
                            </thead>
                            <tbody className="text-gray-700">
                    {data &&
                        data.map(item => {
                            if ((item.id % 2) == 0) {
                                return (
                                    <tr key={item.id}>
                                        <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.id}</a></td>
                                        <td className="w-1/3 text-left py-3 px-4">{item.attributes.title}</td>
                                        <td className="w-1/3 text-left py-3 px-4">{item.type}</td>
                                        <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.magnitude}</a></td>
                                        <td className="w-1/3 text-left py-3 px-4">{item.attributes.mag_type}</td>
                                        <td className="w-1/3 text-left py-3 px-4">{item.attributes.place}</td>
                                        <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.time}</a></td>
                                        <td className="w-1/3 text-left py-3 px-4">{item.attributes.tsunami ? 'Yes' : 'No'}</td>
                                        <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.coordinates[0]},{' '}
                                                {item.attributes.coordinates[1]}</a></td>
                                        <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.external_id}</a></td>
                                        <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href={item.links.external_url}>link</a></td>
                                    </tr>
                                )
                            }else{
                                return(
                                <tr className="bg-gray-200" key={item.id}>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.id}</a></td>
                                    <td className="w-1/3 text-left py-3 px-4">{item.attributes.title}</td>
                                    <td className="w-1/3 text-left py-3 px-4">{item.type}</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.magnitude}</a></td>
                                    <td className="w-1/3 text-left py-3 px-4">{item.attributes.mag_type}</td>
                                    <td className="w-1/3 text-left py-3 px-4">{item.attributes.place}</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.time}</a></td>
                                    <td className="w-1/3 text-left py-3 px-4">{item.attributes.tsunami ? 'Yes' : 'No'}</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.coordinates[0]},{' '}
                                            {item.attributes.coordinates[1]}</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500">{item.attributes.external_id}</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href={item.links.external_url}>link</a></td>
                                </tr>
                                )
                            }
                        })}
                </tbody>
                            {/* <tbody className="text-gray-700">
                                <tr>
                                    <td className="w-1/3 text-left py-3 px-4">Lian</td>
                                    <td className="w-1/3 text-left py-3 px-4">Smith</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr className="bg-gray-200">
                                    <td className="w-1/3 text-left py-3 px-4">Emma</td>
                                    <td className="w-1/3 text-left py-3 px-4">Johnson</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr>
                                    <td className="w-1/3 text-left py-3 px-4">Oliver</td>
                                    <td className="w-1/3 text-left py-3 px-4">Williams</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr className="bg-gray-200">
                                    <td className="w-1/3 text-left py-3 px-4">Isabella</td>
                                    <td className="w-1/3 text-left py-3 px-4">Brown</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr>
                                    <td className="w-1/3 text-left py-3 px-4">Lian</td>
                                    <td className="w-1/3 text-left py-3 px-4">Smith</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr className="bg-gray-200">
                                    <td className="w-1/3 text-left py-3 px-4">Emma</td>
                                    <td className="w-1/3 text-left py-3 px-4">Johnson</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr>
                                    <td className="w-1/3 text-left py-3 px-4">Oliver</td>
                                    <td className="w-1/3 text-left py-3 px-4">Williams</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                                <tr className="bg-gray-200">
                                    <td className="w-1/3 text-left py-3 px-4">Isabella</td>
                                    <td className="w-1/3 text-left py-3 px-4">Brown</td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="tel:622322662">622322662</a></td>
                                    <td className="text-left py-3 px-4"><a className="hover:text-blue-500" href="mailto:jonsmith@mail.com">jonsmith@mail.com</a></td>
                                </tr>
                            </tbody> */}
                        </table>
                    </div>
                </div>
            </main>
    </div>
    </div>
  )
}
